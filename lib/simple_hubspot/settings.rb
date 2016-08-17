module SimpleHubspot
  class Settings
    class << self
      def configure(&block)
        yield self
      end
    end
  end
end
