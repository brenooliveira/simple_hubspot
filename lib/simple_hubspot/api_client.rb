module SimpleHubspot
  class ApiClient
    class << self

      def do_post(path = nil, params = {}, headers = {})
        RestClient.post "#{SimpleHubspot.configuration.api_base}#{path}#{add_apikey}", params, { content_type: :json }
      end

      def get(path)
        # get
      end

      private
        def add_apikey
          "?hapikey=#{SimpleHubspot.configuration.hapikey}"
        end

    end
  end
end
