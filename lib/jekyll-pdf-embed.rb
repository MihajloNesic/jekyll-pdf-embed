require "jekyll"

class PDFEmbedTest < Liquid::Tag

    def initialize(tagName, content, tokens)
        super
        @content = content

        # define allowed extensions
        @allowed_files = [".pdf", ".ppt", ".pptx"]

        # get the 'no_link' param and check if it is present
        @param = @content.split(/ /).last
        @no_link = @param == 'no_link' ? true : false
    end
    
    def render(context)
        if @no_link
            # if 'no_link' is present then
            # remove only the last occurence of 'no_link' keyword
            # https://www.regular-expressions.info/keep.html
            @content = @content.sub(/.*\K no_link/, '')
        end

        @link = "#{context[@content.strip]}"

        # get extension and check if it is allowed 
        @extension = File.extname(@link)
        @is_allowed = @allowed_files.include? @extension

        if !@is_allowed
            raise ArgumentError, 'ERROR:file_not_allowed -> ' + @link
        end

        if @extension == ".pdf"
            if @no_link
                %Q{<style>.pdf-embed-container { position: relative; padding-bottom: 56.25%; height: 0; overflow: hidden; max-width: 100%; margin-bottom: 20px; } .pdf-embed-container iframe, .pdf-embed-container object, .pdf-embed-container embed { position: absolute; top: 0; left: 0; width: 100%; height: 100%; }</style><div class='pdf-embed-container'><iframe title="PDF file" width="640" height="390" src="#{@link}" frameborder="0" allowfullscreen></iframe></div>}
            else
                %Q{<style>.pdf-embed-container { position: relative; padding-bottom: 56.25%; height: 0; overflow: hidden; max-width: 100%; margin-bottom: 20px; border-style: solid; } .pdf-link { background-color: white; text-align: center; border-style: solid; } .pdf-embed-container iframe, .pdf-embed-container object, .pdf-embed-container embed { position: absolute; top: 0; left: 0; width: 100%; height: 100%; }</style><div class='pdf-link'><a href="#{@link}" target="_blank">View PDF</a></div><div class='pdf-embed-container'><iframe title="PDF file" width="640" height="390" src="#{@link}" frameborder="0" allowfullscreen></iframe></div>}
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
                %Q{<style>.pdf-embed-container { position: relative; padding-bottom: 56.25%; height: 0; overflow: hidden; max-width: 100%; margin-bottom: 20px; } .pdf-embed-container iframe, .pdf-embed-container object, .pdf-embed-container embed { position: absolute; top: 0; left: 0; width: 100%; height: 100%; }</style><div class='pdf-embed-container'><iframe title="PDF file" width="640" height="390" src="#{@link}" frameborder="0" allowfullscreen></iframe></div>}
            else
                %Q{<style>.pdf-embed-container { position: relative; padding-bottom: 56.25%; height: 0; overflow: hidden; max-width: 100%; margin-bottom: 20px; border-style: solid; } .pdf-link { background-color: white; text-align: center; border-style: solid; } .pdf-embed-container iframe, .pdf-embed-container object, .pdf-embed-container embed { position: absolute; top: 0; left: 0; width: 100%; height: 100%; }</style><div class='pdf-link'><a href="#{@link}" target="_blank">View presentation</a></div><div class='pdf-embed-container'><iframe title="Presentation file" width="640" height="390" src="#{@link}" frameborder="0" allowfullscreen></iframe></div>}
            end
        end

    end
    
    Liquid::Template.register_tag('pdf', self)
end