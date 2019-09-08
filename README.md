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
plugins: [jekyll-pdf-embed]
 # This will require each of these gems automatically.
```

## Usage

You can use external PDF files
```
 {% pdf http://www.africau.edu/images/default/sample.pdf %}
```

or local
```
 {% pdf /files/pdf/sample.pdf %}
```

## Result

The embedded pdf output

![](https://i.imgur.com/TpTQehM.png)
