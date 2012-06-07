module RtfTemplater
  module Generator

    def dec string
      string.unpack('U*').map { |n| n < 128 ? n.chr : n < 256 ? "\\'#{n.to_s(16)}" : "\\u#{n}\\'3f" }.join
    end

    def render_rtf content
      template = Template.new
      template.process content, binding
    end

  end
end
