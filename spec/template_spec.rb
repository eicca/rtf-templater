# encoding: utf-8
require 'spec_helper'

module RtfTemplater

  describe Template do
    include Generator
    
    before(:each) do
    end

    after(:each) do
      save_result(@result, @template_name)
    end

    it 'should process a document with simple variable substitution' do
      @name = 'Mikle Jackson'
      @age = '50'
      @template_name = 'simple_variables.rtf'

      template = Template.new fixture(@template_name)
      @result = template.process binding
      @result.should include 'Mikle Jackson'
      @result.should include '50'
    end

    it 'should process a document with variables of various types' do
      @name = :Mikle
      @age = 50
      @template_name = 'simple_variables.rtf'

      template = Template.new fixture(@template_name)
      @result = template.process binding
      @result.should include 'Mikle'
      @result.should include '50'
    end

    it 'should process an advanced document' do
      Band = Struct.new(:name, :genre)
      Singer = Struct.new(:name, :age)
      @bands = [Band.new('Metallica', 'trash-metal'), Band.new(:Mastodon, 'progressive-metal'),
        Band.new('Black-Sabbath', 'heavy-metal')]
      @singers = [Singer.new('Mikle Jackson', 50), Singer.new('Alla B', 90)]
      @template_name = 'advanced_document.rtf'
      template = Template.new fixture(@template_name)
      @result = template.process binding

      ['Metallica', 'trash-metal', 'Mastodon', 'progressive-metal', 'Black-Sabbath', 'heavy-metal',
        'Mikle Jackson', '60', 'Alla B', '100'].each do |text|
        @result.should include text
      end
    end
  
    it 'should process a document with UTF-8 content and variables' do
      @name = 'Алла Пугачева'
      @genre = 'Популярная музыка'
      @template_name = 'simple_variables_ru.rtf'

      template = Template.new fixture(@template_name)
      @result = template.process binding
      @result.should include dec('Алла Пугачева')
      @result.should include dec('Популярная музыка')
    end

  end
end
