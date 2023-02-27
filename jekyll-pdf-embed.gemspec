# frozen_string_literal: true

require_relative 'lib/jekyll-pdf-embed/version'

Gem::Specification.new do |s|
    s.name        = 'jekyll-pdf-embed'
    s.version     = Jekyll::JekyllPDFEmbed::VERSION
    s.authors     = ['Mihajlo Nesic']
    s.email       = 'nesicmihajlo98@gmail.com'

    s.date        = '2023-02-27'
    s.summary     = 'Jekyll plugin for embedding PDF files to any page or post'
    s.description = %(
	Jekyll PDF Embed is a ruby gem for Jekyll static site generator.
	It allows user to easily embed external or local PDF files to any page or blog post.
  )
    s.files       = ["lib/jekyll-pdf-embed.rb", "lib/jekyll-pdf-embed/pdf-tag.rb", "lib/jekyll-pdf-embed/version.rb"]
    s.homepage    = 'https://github.com/MihajloNesic/jekyll-pdf-embed'
    s.license     = 'GPL-3.0'

    s.require_paths = ['lib']
    s.add_dependency 'jekyll'
end
