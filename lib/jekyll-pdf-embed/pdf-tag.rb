# frozen_string_literal: true

require 'jekyll'
require 'securerandom'

class JekyllPDFEmbed < Liquid::Tag

    NO_LINK_ARG = 'no_link'

    def initialize(tag_name, content, tokens)
        super
        @content = content

        # define allowed extensions
        @allowed_files = %w[.pdf .ppt .pptx]

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
        @width = @other_args['width']
        @height = @other_args['height']

        # default width and height values
        @width = '100%' if @width.nil?
        @height = '650px' if @height.nil?

        raise ArgumentError, "ERROR:file_not_allowed -> #{@link}" unless @is_allowed

        @label = ''

        case @extension
        when '.pdf'
            @label = 'View PDF'
        when '.ppt', '.pptx'
            @label = 'View presentation'
            # checks if the presentation is not on remote address
            if !@link.include? 'http://' and !@link.include? 'https://'
                # get base url and append file location to it
                @baseurl = context.registers[:site].config['url'].to_s
                @link = "https://view.officeapps.live.com/op/embed.aspx?src=#{@baseurl}#{@link}"
                # locally, this will not work
                # but once the Jekyll site is hosted remotely, the baseurl will not be 'localhost'
            else
                @link = "https://view.officeapps.live.com/op/embed.aspx?src=#{@link}"
            end
        else
            raise ArgumentError, "ERROR:extension_not_recognized -> #{@extension} for link -> #{@link}"
        end

        if @no_link
            %(
            <style>
                .pdf-embed-wrap-#{@uuid} {
                    display: flex;
                    flex-direction: column;
                    width: #{@width};
                    height: #{@height};
                }
                .pdf-embed-container-#{@uuid} {
                    height: 100%;
                }
                .pdf-embed-container-#{@uuid} iframe {
                    width: 100%;
                    height: 100%;
                }
            </style>
            <div class="pdf-embed-wrap-#{@uuid}">
                <div class="pdf-embed-container-#{@uuid}">
                    <iframe src="#{@link}" frameborder="0" allowfullscreen></iframe>
                </div>
            </div>
            ).gsub(/\n+/, '').gsub(/\s+/, ' ').lstrip.chop.strip
        else
            %(
            <style>
                .pdf-embed-wrap-#{@uuid} {
                    display: flex;
                    flex-direction: column;
                    width: #{@width};
                    height: #{@height};
                }
                .pdf-embed-container-#{@uuid} {
                    height: 100%;
                }
                .pdf-link-#{@uuid} {
                    background-color: white;
                    text-align: center;
                    border-style: solid;
                }
                .pdf-embed-container-#{@uuid} iframe {
                    width: 100%;
                    height: 100%;
                }
            </style>
            <div class="pdf-embed-wrap-#{@uuid}">
                <div class="pdf-link-#{@uuid}">
                    <a href="#{@link}" target="_blank">#{@label}</a>
                </div>
                <div class="pdf-embed-container-#{@uuid}">
                    <iframe src="#{@link}" frameborder="0" allowfullscreen></iframe>
                </div>
            </div>
            ).gsub(/\n+/, '').gsub(/\s+/, ' ').lstrip.chop.strip
        end
    end

    # Transform 'a=b c=d' into hash
    def hash_from_args(args_array)
        keys_values = args_array.map { |item| item.split(/\s*=\s*/) }
        Hash[keys_values]
    end

    Liquid::Template.register_tag('pdf', self)
end
