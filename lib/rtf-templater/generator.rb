module RtfTemplater
  module Generator

    def dec string
      out = string.to_s
      out.unpack('U*').map { |n| n < 128 ? n.chr : n < 256 ? "\\'#{n.to_s(16)}" : "\\u#{n}\\'3f" }.join
    end

    def render_rtf content
      template = Template.new content
      template.process binding
    end

  end
end
