# Jekyll PDF Embed [![Gem Version](https://badge.fury.io/rb/jekyll-pdf-embed.svg)](https://badge.fury.io/rb/jekyll-pdf-embed) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

**Jekyll PDF Embed** is a ruby gem for [Jekyll](https://jekyllrb.com/) static site generator.
It allows user to easily embed external or local PDF files to any page or blog post.

## Installation

Add this line to your Gemfile:

```ruby
group :jekyll_plugins do
  gem "jekyll-pdf-embed"
end
```

And then execute:

    $ bundle

Alternatively install the gem yourself as:

    $ gem install jekyll-pdf-embed

and put this in your ``_config.yml`` 

```yaml
plugins:
  - jekyll-pdf-embed
```

## Usage

You can use external PDF files
```
 {% pdf "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf" %}
```

or local
```
 {% pdf "/files/pdf/sample.pdf" %}
```

Use `no_link` to hide link to pdf file ('View PDF' header)
```
{% raw %}
 {% pdf "/files/pdf/sample.pdf" no_link %}
{% endraw %}
```

## Result

The embedded pdf output

[DEMO](https://mihajlonesic.gitlab.io/projects/jekyll-pdf-embed/#result)

![](https://i.imgur.com/hdiVfm0.jpg)
