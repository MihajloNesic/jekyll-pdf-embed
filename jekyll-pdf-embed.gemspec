Gem::Specification.new do |s|
  s.name        = 'jekyll-pdf-embed'
  s.version     = '1.0.2'
  s.authors     = ["Mihajlo Nesic"]
  s.email       = 'nesicmihajlo98@gmail.com'
  
  s.date        = '2019-09-24'
  s.summary     = "Jekyll plugin for embedding PDF files to any page or post"
  s.description = %q{
	Jekyll PDF Embed is a ruby gem for Jekyll static site generator.
	It allows user to easily embed external or local PDF files to any page or blog post.
  }
  s.files       = ["lib/jekyll-pdf-embed.rb"]
  s.homepage    = 'https://github.com/MihajloNesic/jekyll-pdf-embed'
  s.license     = 'MIT'
  
  s.add_dependency 'jekyll'
end