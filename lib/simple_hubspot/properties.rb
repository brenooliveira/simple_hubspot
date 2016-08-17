module SimpleHubspot
  class Properties

    def initialize
      @properties = []
    end

    def add(key, value)
      @properties << { "#{key}": value }
      self
    end

    def size
      @properties.size
    end

    def to_json
      @properties.to_json
    end
  end
end
