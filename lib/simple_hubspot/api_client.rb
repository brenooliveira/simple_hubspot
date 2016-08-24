module SimpleHubspot
  class ApiClient
    class << self

      def do_post(path = nil, params = {}, headers = {})
        response = RestClient.post "#{SimpleHubspot.configuration.api_base}#{path}#{add_apikey}", params.to_json, { content_type: :json }
        json = JSON.parse(response.body, symbolize_names: true)
        json.merge(success: true)
      rescue RestClient::BadRequest => e
        json = JSON.parse(e.response.body, symbolize_names: true)
        json.merge(success: false)
      end

      private
        def add_apikey
          "?hapikey=#{SimpleHubspot.configuration.hapikey}"
        end

    end
  end
end
