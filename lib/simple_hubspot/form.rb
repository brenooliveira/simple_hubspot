module SimpleHubspot
  class Form

    class << self

      def submit_form(guid, params)
        raise ArgumentError unless guid
        ApiClient.do_form_post guid, { properties: Utils.hash_to_properties(params) }
      end
    end

  end
end
