# Jekyll PDF Embed [![Gem Version](https://badge.fury.io/rb/jekyll-pdf-embed.svg)](https://badge.fury.io/rb/jekyll-pdf-embed) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

[Jekyll](https://jekyllrb.com/) plugin for embedding PDF files to any page or post.

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

## Result

The embedded pdf output

![](https://i.imgur.com/TpTQehM.png)
