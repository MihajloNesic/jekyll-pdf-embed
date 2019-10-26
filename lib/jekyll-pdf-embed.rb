require "jekyll"

class PDFEmbed < Liquid::Tag
        
    def initialize(tag_name, text, tokens)
        super
        @link = text[/".*?"/]
        @link_escaped = @link.gsub(" ", "%20")
        @text = text.gsub(@link, @link_escaped)
        *@params = @text.split(/ /)
    end
  
    def render(context)
        if @params.length == 1
            %Q{<style>.pdf-embed-container { position: relative; padding-bottom: 56.25%; height: 0; overflow: hidden; max-width: 100%; margin-bottom: 20px; border-style: solid; } .pdf-link { background-color: white; text-align: center; border-style: solid; } .pdf-embed-container iframe, .pdf-embed-container object, .pdf-embed-container embed { position: absolute; top: 0; left: 0; width: 100%; height: 100%; }</style><div class='pdf-link'><a href=#{@link_escaped} target="_blank">View PDF</a></div><div class='pdf-embed-container'><iframe title="PDF file" width="640" height="390" src=#{@link_escaped} frameborder="0" allowfullscreen></iframe></div>}
        elsif @params.length == 2 && @params[1] == 'no_link'
            %Q{<style>.pdf-embed-container { position: relative; padding-bottom: 56.25%; height: 0; overflow: hidden; max-width: 100%; margin-bottom: 20px; } .pdf-embed-container iframe, .pdf-embed-container object, .pdf-embed-container embed { position: absolute; top: 0; left: 0; width: 100%; height: 100%; }</style><div class='pdf-embed-container'><iframe title="PDF file" width="640" height="390" src=#{@link_escaped} frameborder="0" allowfullscreen></iframe></div>}
        else
            raise ArgumentError, 'ERROR:bad_syntax'
        end
    end

    Liquid::Template.register_tag('pdf', self)
end