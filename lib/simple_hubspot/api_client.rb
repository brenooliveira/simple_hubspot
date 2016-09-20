module SimpleHubspot
  class ApiClient
    class << self

      def do_post(path = nil, params = {}, headers = {})
        response = RestClient.post "#{SimpleHubspot.configuration.api_base}#{path}#{add_apikey}", params.to_json, { content_type: :json }
        response_success response.body
      rescue RestClient::BadRequest => e
        response_fail e.response.body
      end

      def do_get(path = nil, params = {}, headers = {})
        response = RestClient.get "#{SimpleHubspot.configuration.api_base}#{path}#{add_apikey}"
        json = JSON.parse(response.body, symbolize_names: true)
        json.merge(success: true)
      rescue RestClient::BadRequest => e
        response_fail e.response.body
      end

      def do_form_post(guid = nil, params = {}, headers = {})
        response = RestClient.post "#{SimpleHubspot.configuration.form_submit_base}#{SimpleHubspot.configuration.portal_id}/#{guid}",
                                   params.to_json,
                                   { content_type: 'application/x-www-form-urlencoded'}
        response_success response.body
      rescue RestClient::BadRequest => e
        response_fail e.response.body
      rescue RestClient::NotFound => e
        response_fail e.response.body
      end

      private
        def add_apikey
          "?hapikey=#{SimpleHubspot.configuration.hapikey}"
        end

        def response_fail(response = {})
          return { success: false } if response.empty?
          json = JSON.parse(response, symbolize_names: true)
          json.merge(success: false)
        end

        def response_success(response = {})
          return { success: true } if response.empty?
          json = JSON.parse(response, symbolize_names: true)
          json.merge(success: true)
        end

    end
  end
end
