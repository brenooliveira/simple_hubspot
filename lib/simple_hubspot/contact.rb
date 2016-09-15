module SimpleHubspot
  class Contact

    class << self

      def create_or_update(email, params)
        ApiClient.do_post "/contacts/v1/contact/createOrUpdate/email/#{email}", { properties: Utils.hash_to_properties(params) }
      end

      def find_by_email(email)
        ApiClient.do_get "/contacts/v1/contact/email/#{email}/profile"
      end

      def update(vid, params = {})
        raise ArgumentError unless vid
        ApiClient.do_post "/contacts/v1/contact/vid/#{vid}/profile", { properties: Utils.hash_to_properties(params) }
      end
    end

  end
end
