module SimpleHubspot
  class Utils
    class << self
      def properties_to_hash(props)
        newprops = HashWithIndifferentAccess.new
        props.each { |k, v| newprops[k] = v["value"] }
        newprops
      end

      def hash_to_properties(hash, opts = {})
        key_name = opts[:key_name] || "property"
        hash.map { |k, v| { key_name => k.to_s, "value" => v } }
      end
    end
  end
end
