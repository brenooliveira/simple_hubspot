module SimpleHubspot
  class Form

    class << self

      def submit_form(guid, params)
        raise ArgumentError unless guid
        ApiClient.do_form_post guid, params
      end
    end

  end
end
