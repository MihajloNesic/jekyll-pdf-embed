require "jekyll"
require "securerandom"

class PDFEmbedTest < Liquid::Tag

    NO_LINK_ARG = "no_link".freeze

    def initialize(tagName, content, tokens)
        super
        @content = content

        # define allowed extensions
        @allowed_files = [".pdf", ".ppt", ".pptx"]

        # current container uuid
        @uuid = SecureRandom.uuid
    end
    
    def render(context)
        @parsed_content = Liquid::Template.parse(@content).render(context)
        @args = @parsed_content.split(/ /)

        @link_raw = @args.first
        @link = @link_raw.tr('\"', '')

        @no_link = @args.include? NO_LINK_ARG
        @extension = File.extname(@link)
        @is_allowed = @allowed_files.include? @extension

        @other_args_raw = @parsed_content.clone
        @other_args_raw.slice! @link_raw
        @other_args_raw.slice! NO_LINK_ARG
        @other_args_raw.strip!

        @other_args_array = @other_args_raw.split(/ /)

        @other_args = hash_from_args(@other_args_array)
        @w = @other_args["width"]
        @h = @other_args["height"]

        # default width and height values
        if @w == nil
            @w = "100%"
        end

        if @h == nil
            @h = "500px"
        end

        if !@is_allowed
            raise ArgumentError, 'ERROR:file_not_allowed -> ' + @link
        end

        if @extension == ".pdf"
            if @no_link
                %Q{<style>.pdf-embed-wrap-#{@uuid} { display:flex; flex-direction: column; width: #{@w}; height: #{@h}; } .pdf-embed-container-#{@uuid} { height: 100%; } .pdf-embed-container-#{@uuid} iframe { width: 100%; height: 100%; }</style><div class="pdf-embed-wrap-#{@uuid}"><div class='pdf-embed-container-#{@uuid}'><iframe title="PDF file" src="#{@link}" frameborder="0" allowfullscreen></iframe></div></div>}
            else
                %Q{<style>.pdf-embed-wrap-#{@uuid} { display:flex; flex-direction: column; width: #{@w}; height: #{@h}; } .pdf-embed-container-#{@uuid} { height: 100%; } .pdf-link-#{@uuid} { background-color: white; text-align: center; border-style: solid; } .pdf-embed-container-#{@uuid} iframe { width: 100%; height: 100%; }</style><div class="pdf-embed-wrap-#{@uuid}"><div class='pdf-link-#{@uuid}'><a href="#{@link}" target="_blank">View PDF</a></div><div class='pdf-embed-container-#{@uuid}'><iframe title="PDF file" src="#{@link}" frameborder="0" allowfullscreen></iframe></div></div>}
            end
        elsif @extension == ".ppt" or @extension == ".pptx"

            # checks if the presentation is not on remote address
            if !@link.include? "http://" and !@link.include? "https://"
                # get base url and appent file location to it
                @baseurl = "#{context.registers[:site].config['url']}"
                @link = "https://view.officeapps.live.com/op/embed.aspx?src=#{@baseurl}#{@link}"
                # locally, this will not work
                # but once the Jekyll site is hosted remotely, the baseurl will not be 'localhost'
            else
                @link = "https://view.officeapps.live.com/op/embed.aspx?src=#{@link}"
            end

            if @no_link
                %Q{<style>.pdf-embed-wrap-#{@uuid} { display:flex; flex-direction: column; width: #{@w}; height: #{@h}; } .pdf-embed-container-#{@uuid} { height: 100%; } .pdf-embed-container-#{@uuid} iframe { width: 100%; height: 100%; }</style><div class="pdf-embed-wrap-#{@uuid}"><div class='pdf-embed-container-#{@uuid}'><iframe title="Presentation file" src="#{@link}" frameborder="0" allowfullscreen></iframe></div></div>}
            else
                %Q{<style>.pdf-embed-wrap-#{@uuid} { display:flex; flex-direction: column; width: #{@w}; height: #{@h}; } .pdf-embed-container-#{@uuid} { height: 100%; } .pdf-link-#{@uuid} { background-color: white; text-align: center; border-style: solid; } .pdf-embed-container-#{@uuid} iframe { width: 100%; height: 100%; }</style><div class="pdf-embed-wrap-#{@uuid}"><div class='pdf-link-#{@uuid}'><a href="#{@link}" target="_blank">View presentation</a></div><div class='pdf-embed-container-#{@uuid}'><iframe title="Presentation file" src="#{@link}" frameborder="0" allowfullscreen></iframe></div></div>}
            end
        end

    end

    # Transform 'a=b c=d' into hash
    def hash_from_args(args_array)
        keys_values = args_array.map {|item| item.split /\s*=\s*/ }
        return Hash[keys_values]
    end

    def remove_quotations(str)
        if str.start_with?('"')
            str = str.slice(1..-1)
        end
        if str.end_with?('"')
            str = str.slice(0..-2)
        end
    end 
    
    Liquid::Template.register_tag('pdf', self)
end