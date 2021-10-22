# frozen_string_literal: true

require 'jekyll-pdf-embed'
require 'jekyll'

RSpec.describe Jekyll::JekyllPDFEmbed do
    it 'has a version number' do
        puts "Jekyll PDF Embed version: #{Jekyll::JekyllPDFEmbed::VERSION}"
        puts "\n"
        expect(Jekyll::JekyllPDFEmbed::VERSION).not_to be nil
    end

    describe 'pdf' do

        context 'pdf, remote url, with link, default size' do
            template = Liquid::Template.parse('{% pdf "https://mihajlonesic.gitlab.io/files/loremipsum.pdf" %}')
            rendered = template.render.gsub(/\n+/, '').gsub(/\s+/, ' ')

            # extract the UUID
            reg = rendered.match(/\.pdf-embed-wrap-[\da-z-]*/)
            tag_uuid = reg[0]
            tag_uuid.slice! '.pdf-embed-wrap-'

            let(:tag_rendered) { rendered }
            let(:expected) do
                %(
                   <style>
                       .pdf-embed-wrap-#{tag_uuid} {
                           display:flex;
                           flex-direction: column;
                           width: 100%;
                           height: 650px;
                       }
                       .pdf-embed-container-#{tag_uuid} {
                           height: 100%;
                       }
                       .pdf-link-#{tag_uuid} {
                           background-color: white;
                           text-align: center;
                           border-style: solid;
                       }
                       .pdf-embed-container-#{tag_uuid} iframe {
                           width: 100%;
                           height: 100%;
                       }
                   </style>
                   <div class="pdf-embed-wrap-#{tag_uuid}">
                       <div class="pdf-link-#{tag_uuid}">
                           <a href="https://mihajlonesic.gitlab.io/files/loremipsum.pdf" target="_blank">View PDF</a>
                       </div>
                       <div class="pdf-embed-container-#{tag_uuid}">
                           <iframe src="https://mihajlonesic.gitlab.io/files/loremipsum.pdf" frameborder="0" allowfullscreen></iframe>
                       </div>
                   </div>
                   ).gsub(/\n+/, '').gsub(/\s+/, ' ').lstrip.chop
            end

            it 'renders pdf with remote url, with link, default size' do
                puts 'test: pdf, remote url, with link, default size'
                puts "rendered: #{tag_rendered}"
                puts "expected: #{expected}"
                puts "\n"
                expect(tag_rendered).to eq expected
            end
        end

        context 'pdf, remote url, with link, custom size' do
            template = Liquid::Template.parse('{% pdf "https://mihajlonesic.gitlab.io/files/loremipsum.pdf" width=150px height=40% %}')
            rendered = template.render.gsub(/\n+/, '').gsub(/\s+/, ' ')

            # extract the UUID
            reg = rendered.match(/\.pdf-embed-wrap-[\da-z-]*/)
            tag_uuid = reg[0]
            tag_uuid.slice! '.pdf-embed-wrap-'

            let(:tag_rendered) { rendered }
            let(:expected) do
                %(
                   <style>
                       .pdf-embed-wrap-#{tag_uuid} {
                           display:flex;
                           flex-direction: column;
                           width: 150px;
                           height: 40%;
                       }
                       .pdf-embed-container-#{tag_uuid} {
                           height: 100%;
                       }
                       .pdf-link-#{tag_uuid} {
                           background-color: white;
                           text-align: center;
                           border-style: solid;
                       }
                       .pdf-embed-container-#{tag_uuid} iframe {
                           width: 100%;
                           height: 100%;
                       }
                   </style>
                   <div class="pdf-embed-wrap-#{tag_uuid}">
                       <div class="pdf-link-#{tag_uuid}">
                           <a href="https://mihajlonesic.gitlab.io/files/loremipsum.pdf" target="_blank">View PDF</a>
                       </div>
                       <div class="pdf-embed-container-#{tag_uuid}">
                           <iframe src="https://mihajlonesic.gitlab.io/files/loremipsum.pdf" frameborder="0" allowfullscreen></iframe>
                       </div>
                   </div>
                   ).gsub(/\n+/, '').gsub(/\s+/, ' ').lstrip.chop
            end

            it 'renders pdf with remote url, with link, custom size' do
                puts 'test: pdf, remote url, without link, custom size'
                puts "rendered: #{tag_rendered}"
                puts "expected: #{expected}"
                puts "\n"
                expect(tag_rendered).to eq expected
            end
        end

        context 'pdf, remote url, without link, default size' do
            template = Liquid::Template.parse('{% pdf "https://mihajlonesic.gitlab.io/files/loremipsum.pdf" no_link %}')
            rendered = template.render.gsub(/\n+/, '').gsub(/\s+/, ' ')

            # extract the UUID
            reg = rendered.match(/\.pdf-embed-wrap-[\da-z-]*/)
            tag_uuid = reg[0]
            tag_uuid.slice! '.pdf-embed-wrap-'

            let(:tag_rendered) { rendered }
            let(:expected) do
                %(
                   <style>
                       .pdf-embed-wrap-#{tag_uuid} {
                           display:flex;
                           flex-direction: column;
                           width: 100%;
                           height: 650px;
                       }
                       .pdf-embed-container-#{tag_uuid} {
                           height: 100%;
                       }
                       .pdf-embed-container-#{tag_uuid} iframe {
                           width: 100%;
                           height: 100%;
                       }
                   </style>
                   <div class="pdf-embed-wrap-#{tag_uuid}">
                       <div class="pdf-embed-container-#{tag_uuid}">
                           <iframe src="https://mihajlonesic.gitlab.io/files/loremipsum.pdf" frameborder="0" allowfullscreen></iframe>
                       </div>
                   </div>
                   ).gsub(/\n+/, '').gsub(/\s+/, ' ').lstrip.chop
            end

            it 'renders pdf with remote url, without link, default size' do
                puts 'test: pdf, remote url, without link, default size'
                puts "rendered: #{tag_rendered}"
                puts "expected: #{expected}"
                puts "\n"
                expect(tag_rendered).to eq expected
            end
        end

        context 'pdf, remote url, without link, custom size' do
            template = Liquid::Template.parse('{% pdf "https://mihajlonesic.gitlab.io/files/loremipsum.pdf" width=150px height=40% no_link %}')
            rendered = template.render.gsub(/\n+/, '').gsub(/\s+/, ' ')

            # extract the UUID
            reg = rendered.match(/\.pdf-embed-wrap-[\da-z-]*/)
            tag_uuid = reg[0]
            tag_uuid.slice! '.pdf-embed-wrap-'

            let(:tag_rendered) { rendered }
            let(:expected) do
                %(
                   <style>
                       .pdf-embed-wrap-#{tag_uuid} {
                           display:flex;
                           flex-direction: column;
                           width: 150px;
                           height: 40%;
                       }
                       .pdf-embed-container-#{tag_uuid} {
                           height: 100%;
                       }
                       .pdf-embed-container-#{tag_uuid} iframe {
                           width: 100%;
                           height: 100%;
                       }
                   </style>
                   <div class="pdf-embed-wrap-#{tag_uuid}">
                       <div class="pdf-embed-container-#{tag_uuid}">
                           <iframe src="https://mihajlonesic.gitlab.io/files/loremipsum.pdf" frameborder="0" allowfullscreen></iframe>
                       </div>
                   </div>
                   ).gsub(/\n+/, '').gsub(/\s+/, ' ').lstrip.chop
            end

            it 'renders pdf with remote url, with link, custom size' do
                puts 'test: pdf, remote url, without link, custom size'
                puts "rendered: #{tag_rendered}"
                puts "expected: #{expected}"
                puts "\n"
                expect(tag_rendered).to eq expected
            end
        end

        context 'pdf, remote url, with link, custom height' do
            template = Liquid::Template.parse('{% pdf "https://mihajlonesic.gitlab.io/files/loremipsum.pdf" height=700px %}')
            rendered = template.render.gsub(/\n+/, '').gsub(/\s+/, ' ')

            # extract the UUID
            reg = rendered.match(/\.pdf-embed-wrap-[\da-z-]*/)
            tag_uuid = reg[0]
            tag_uuid.slice! '.pdf-embed-wrap-'

            let(:tag_rendered) { rendered }
            let(:expected) do
                %(
                   <style>
                       .pdf-embed-wrap-#{tag_uuid} {
                           display:flex;
                           flex-direction: column;
                           width: 100%;
                           height: 700px;
                       }
                       .pdf-embed-container-#{tag_uuid} {
                           height: 100%;
                       }
                       .pdf-link-#{tag_uuid} {
                           background-color: white;
                           text-align: center;
                           border-style: solid;
                       }
                       .pdf-embed-container-#{tag_uuid} iframe {
                           width: 100%;
                           height: 100%;
                       }
                   </style>
                   <div class="pdf-embed-wrap-#{tag_uuid}">
                       <div class="pdf-link-#{tag_uuid}">
                           <a href="https://mihajlonesic.gitlab.io/files/loremipsum.pdf" target="_blank">View PDF</a>
                       </div>
                       <div class="pdf-embed-container-#{tag_uuid}">
                           <iframe src="https://mihajlonesic.gitlab.io/files/loremipsum.pdf" frameborder="0" allowfullscreen></iframe>
                       </div>
                   </div>
                   ).gsub(/\n+/, '').gsub(/\s+/, ' ').lstrip.chop
            end

            it 'renders pdf with remote url, with link, custom height' do
                puts 'test: pdf, remote url, without link, custom height'
                puts "rendered: #{tag_rendered}"
                puts "expected: #{expected}"
                puts "\n"
                expect(tag_rendered).to eq expected
            end
        end
    end

    describe 'ppt/pptx' do

        context 'ppt, remote url, with link, default size' do
            template = Liquid::Template.parse('{% pdf "http://img.labnol.org/di/PowerPoint.ppt" %}')
            rendered = template.render.gsub(/\n+/, '').gsub(/\s+/, ' ')

            # extract the UUID
            reg = rendered.match(/\.pdf-embed-wrap-[\da-z-]*/)
            tag_uuid = reg[0]
            tag_uuid.slice! '.pdf-embed-wrap-'

            let(:tag_rendered) { rendered }
            let(:expected) do
                %(
                   <style>
                       .pdf-embed-wrap-#{tag_uuid} {
                           display:flex;
                           flex-direction: column;
                           width: 100%;
                           height: 650px;
                       }
                       .pdf-embed-container-#{tag_uuid} {
                           height: 100%;
                       }
                       .pdf-link-#{tag_uuid} {
                           background-color: white;
                           text-align: center;
                           border-style: solid;
                       }
                       .pdf-embed-container-#{tag_uuid} iframe {
                           width: 100%;
                           height: 100%;
                       }
                   </style>
                   <div class="pdf-embed-wrap-#{tag_uuid}">
                       <div class="pdf-link-#{tag_uuid}">
                           <a href="https://view.officeapps.live.com/op/embed.aspx?src=http://img.labnol.org/di/PowerPoint.ppt" target="_blank">View presentation</a>
                       </div>
                       <div class="pdf-embed-container-#{tag_uuid}">
                           <iframe src="https://view.officeapps.live.com/op/embed.aspx?src=http://img.labnol.org/di/PowerPoint.ppt" frameborder="0" allowfullscreen></iframe>
                       </div>
                   </div>
                   ).gsub(/\n+/, '').gsub(/\s+/, ' ').lstrip.chop
            end

            it 'renders ppt with remote url, with link, default size' do
                puts 'test: ppt, remote url, with link, default size'
                puts "rendered: #{tag_rendered}"
                puts "expected: #{expected}"
                puts "\n"
                expect(tag_rendered).to eq expected
            end
        end

        context 'pptx, remote url, with link, default size' do
            template = Liquid::Template.parse('{% pdf "https://mihajlonesic.gitlab.io/files/sample.pptx" %}')
            rendered = template.render.gsub(/\n+/, '').gsub(/\s+/, ' ')

            # extract the UUID
            reg = rendered.match(/\.pdf-embed-wrap-[\da-z-]*/)
            tag_uuid = reg[0]
            tag_uuid.slice! '.pdf-embed-wrap-'

            let(:tag_rendered) { rendered }
            let(:expected) do
                %(
                   <style>
                       .pdf-embed-wrap-#{tag_uuid} {
                           display:flex;
                           flex-direction: column;
                           width: 100%;
                           height: 650px;
                       }
                       .pdf-embed-container-#{tag_uuid} {
                           height: 100%;
                       }
                       .pdf-link-#{tag_uuid} {
                           background-color: white;
                           text-align: center;
                           border-style: solid;
                       }
                       .pdf-embed-container-#{tag_uuid} iframe {
                           width: 100%;
                           height: 100%;
                       }
                   </style>
                   <div class="pdf-embed-wrap-#{tag_uuid}">
                       <div class="pdf-link-#{tag_uuid}">
                           <a href="https://view.officeapps.live.com/op/embed.aspx?src=https://mihajlonesic.gitlab.io/files/sample.pptx" target="_blank">View presentation</a>
                       </div>
                       <div class="pdf-embed-container-#{tag_uuid}">
                           <iframe src="https://view.officeapps.live.com/op/embed.aspx?src=https://mihajlonesic.gitlab.io/files/sample.pptx" frameborder="0" allowfullscreen></iframe>
                       </div>
                   </div>
                   ).gsub(/\n+/, '').gsub(/\s+/, ' ').lstrip.chop
            end

            it 'renders pptx with remote url, with link, default size' do
                puts 'test: pptx, remote url, with link, default size'
                puts "rendered: #{tag_rendered}"
                puts "expected: #{expected}"
                puts "\n"
                expect(tag_rendered).to eq expected
            end
        end

        context 'pptx, remote url, with link, custom size' do
            template = Liquid::Template.parse('{% pdf "https://mihajlonesic.gitlab.io/files/sample.pptx" width=50% height=1000px %}')
            rendered = template.render.gsub(/\n+/, '').gsub(/\s+/, ' ')

            # extract the UUID
            reg = rendered.match(/\.pdf-embed-wrap-[\da-z-]*/)
            tag_uuid = reg[0]
            tag_uuid.slice! '.pdf-embed-wrap-'

            let(:tag_rendered) { rendered }
            let(:expected) do
                %(
                   <style>
                       .pdf-embed-wrap-#{tag_uuid} {
                           display:flex;
                           flex-direction: column;
                           width: 50%;
                           height: 1000px;
                       }
                       .pdf-embed-container-#{tag_uuid} {
                           height: 100%;
                       }
                       .pdf-link-#{tag_uuid} {
                           background-color: white;
                           text-align: center;
                           border-style: solid;
                       }
                       .pdf-embed-container-#{tag_uuid} iframe {
                           width: 100%;
                           height: 100%;
                       }
                   </style>
                   <div class="pdf-embed-wrap-#{tag_uuid}">
                       <div class="pdf-link-#{tag_uuid}">
                           <a href="https://view.officeapps.live.com/op/embed.aspx?src=https://mihajlonesic.gitlab.io/files/sample.pptx" target="_blank">View presentation</a>
                       </div>
                       <div class="pdf-embed-container-#{tag_uuid}">
                           <iframe src="https://view.officeapps.live.com/op/embed.aspx?src=https://mihajlonesic.gitlab.io/files/sample.pptx" frameborder="0" allowfullscreen></iframe>
                       </div>
                   </div>
                   ).gsub(/\n+/, '').gsub(/\s+/, ' ').lstrip.chop
            end

            it 'renders pptx with remote url, with link, custom size' do
                puts 'test: pptx, remote url, with link, custom size'
                puts "rendered: #{tag_rendered}"
                puts "expected: #{expected}"
                puts "\n"
                expect(tag_rendered).to eq expected
            end
        end

        context 'pptx, remote url, without link, default size' do
            template = Liquid::Template.parse('{% pdf "https://mihajlonesic.gitlab.io/files/sample.pptx" no_link %}')
            rendered = template.render.gsub(/\n+/, '').gsub(/\s+/, ' ')

            # extract the UUID
            reg = rendered.match(/\.pdf-embed-wrap-[\da-z-]*/)
            tag_uuid = reg[0]
            tag_uuid.slice! '.pdf-embed-wrap-'

            let(:tag_rendered) { rendered }
            let(:expected) do
                %(
                   <style>
                       .pdf-embed-wrap-#{tag_uuid} {
                           display:flex;
                           flex-direction: column;
                           width: 100%;
                           height: 650px;
                       }
                       .pdf-embed-container-#{tag_uuid} {
                           height: 100%;
                       }
                       .pdf-embed-container-#{tag_uuid} iframe {
                           width: 100%;
                           height: 100%;
                       }
                   </style>
                   <div class="pdf-embed-wrap-#{tag_uuid}">
                       <div class="pdf-embed-container-#{tag_uuid}">
                           <iframe src="https://view.officeapps.live.com/op/embed.aspx?src=https://mihajlonesic.gitlab.io/files/sample.pptx" frameborder="0" allowfullscreen></iframe>
                       </div>
                   </div>
                   ).gsub(/\n+/, '').gsub(/\s+/, ' ').lstrip.chop
            end

            it 'renders pptx with remote url, without link, default size' do
                puts 'test: pptx, remote url, without link, default size'
                puts "rendered: #{tag_rendered}"
                puts "expected: #{expected}"
                puts "\n"
                expect(tag_rendered).to eq expected
            end
        end

        context 'pptx, remote url, without link, custom size' do
            template = Liquid::Template.parse('{% pdf "https://mihajlonesic.gitlab.io/files/sample.pptx" no_link width=50% height=1000px %}')
            rendered = template.render.gsub(/\n+/, '').gsub(/\s+/, ' ')

            # extract the UUID
            reg = rendered.match(/\.pdf-embed-wrap-[\da-z-]*/)
            tag_uuid = reg[0]
            tag_uuid.slice! '.pdf-embed-wrap-'

            let(:tag_rendered) { rendered }
            let(:expected) do
                %(
                   <style>
                       .pdf-embed-wrap-#{tag_uuid} {
                           display:flex;
                           flex-direction: column;
                           width: 50%;
                           height: 1000px;
                       }
                       .pdf-embed-container-#{tag_uuid} {
                           height: 100%;
                       }
                       .pdf-embed-container-#{tag_uuid} iframe {
                           width: 100%;
                           height: 100%;
                       }
                   </style>
                   <div class="pdf-embed-wrap-#{tag_uuid}">
                       <div class="pdf-embed-container-#{tag_uuid}">
                           <iframe src="https://view.officeapps.live.com/op/embed.aspx?src=https://mihajlonesic.gitlab.io/files/sample.pptx" frameborder="0" allowfullscreen></iframe>
                       </div>
                   </div>
                   ).gsub(/\n+/, '').gsub(/\s+/, ' ').lstrip.chop
            end

            it 'renders pptx with remote url, without link, custom size' do
                puts 'test: pptx, remote url, without link, custom size'
                puts "rendered: #{tag_rendered}"
                puts "expected: #{expected}"
                puts "\n"
                expect(tag_rendered).to eq expected
            end
        end
    end

end
