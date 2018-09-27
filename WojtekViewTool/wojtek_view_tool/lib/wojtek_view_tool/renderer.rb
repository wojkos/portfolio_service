module WojtekViewTool
  class Renderer
    def self.copyright name, msg
      "&copy; #{Time.now.year} | <solid>#{name}</solid> #{msg}".html_safe
    end
  end
end