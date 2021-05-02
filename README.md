# Jekyll PDF Embed [![Gem Version](https://badge.fury.io/rb/jekyll-pdf-embed.svg)](https://badge.fury.io/rb/jekyll-pdf-embed) [![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

**Jekyll PDF Embed** is a ruby gem for [Jekyll](https://jekyllrb.com/) static site generator.
It allows user to easily embed external or local PDF files to any page or blog post.

## Installation


### RubyGems

Add this line to your Gemfile:

```ruby
group :jekyll_plugins do
  gem "jekyll-pdf-embed"
end
```

And then execute:
```shell
$ bundle
```

Alternatively install the gem yourself as:

```shell
$ gem install jekyll-pdf-embed
```

and put this in your ``_config.yml`` 

```yaml
plugins:
  - jekyll-pdf-embed
```

### GitHub RubyGems registry

Install from the command line (you can put any version you want, check the latest):

```shell
$ gem install jekyll-pdf-embed --version "1.1.1" --source "https://rubygems.pkg.github.com/mihajlonesic"
```

Alternatively, install via Gemfile:

```ruby
source "https://rubygems.pkg.github.com/mihajlonesic" do
  gem "jekyll-pdf-embed", "1.1.1"
end
```

## Usage

Your file **must** end with `.pdf`, `.ppt` or `.pptx`. Everyting else is forbidden.

### Basic

You can use external PDF files
```
 {% pdf "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf" %}
```

or local
```
 {% pdf "/files/pdf/sample.pdf" %}
```

Use front matter
```
---
pdf_file: "/files/pdf/sample.pdf"
---

{% pdf {{ page.pdf_file }} %}
```

### Parameters

Use `no_link` to hide link to pdf file ('View PDF' header)
```
 {% pdf "/files/pdf/sample.pdf" no_link %}
```

Use `width` and/or `height` parameters to size the container. Default values are _width=100%_ and _height=500px_.<br/>
Order does not matter, and can be used in combination with _no_link_ parameter.
```
 {% pdf "/files/pdf/sample.pdf" width=350px height=500px %}
```

### Presentation

You can also embed PowerPoint presentations!
```
 {% pdf "http://img.labnol.org/di/PowerPoint.ppt" %}
```

Your file **must** end with `.pdf`, `.ppt` or `.pptx`. Everyting else is forbidden.

## Result

The embedded pdf output

[DEMO](https://mihajlonesic.gitlab.io/projects/jekyll-pdf-embed/#result) <br/>
[MORE EXAMPLES](https://mihajlonesic.gitlab.io/jpe-examples/)

![](https://i.imgur.com/hdiVfm0.jpg)
