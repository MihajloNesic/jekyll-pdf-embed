require "jekyll"

class PDFEmbed < Liquid::Tag
        
    def initialize(tag_name, text, tokens)
        super
        @text = text
    end
  
    def render(context)
        %Q{<style>.pdf-embed-container { position: relative; padding-bottom: 56.25%; height: 0; overflow: hidden; max-width: 100%; margin-bottom: 20px; border-style: solid; } .pdf-link { background-color: white; text-align: center; border-style: solid; } .pdf-embed-container iframe, .pdf-embed-container object, .pdf-embed-container embed { position: absolute; top: 0; left: 0; width: 100%; height: 100%; }</style><div class='pdf-link'><a href=#{@text}>View PDF</a></div><div class='pdf-embed-container'><iframe title="PDF file" width="640" height="390" src=#{@text} frameborder="0" allowfullscreen></iframe></div>}
    end

    Liquid::Template.register_tag('pdf', self)
end
  