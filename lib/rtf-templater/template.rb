require "erb"

module RtfTemplater
  class Template

    def initialize content
      @content = content
    end

    def process context
      @content = @content.gsub /<[^>]*>/ do |erb|
        erb = erb.gsub("\r", "\\r").gsub("\n", "\\n")
        erb = erb.gsub(/\\\w*\s?/,'').gsub(/[{}]/,'')
      end
      @content = @content.gsub("<%=", "<%= dec ")
      template = ERB.new @content
      template.result context
    end

  end
end
