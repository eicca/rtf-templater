require 'erb'

module RtfTemplater
  class Template

    def initialize content
      @content = content
    end

    def process context
      clear_tags
      encode_utf8
      template = ERB.new @content
      template.result context
    end

    private
    
    def clear_tags
      @content = @content.gsub /<[^>]*>/ do |erb|
        erb = erb.gsub("\r", "\\r").gsub("\n", "\\n")
        erb = erb.gsub(/\\\w*\s?/,'').gsub(/[{}]/,'')
      end
    end

    def encode_utf8
      @content = @content.gsub("<%=", "<%= dec ")
    end

  end
end
