module SimpleHubspot
  class Contact

    class << self

      def create_or_update(email, params)
        ApiClient.do_post "/contacts/v1/contact/createOrUpdate/email/#{email}", { properties: Utils.hash_to_properties(params) }
      end

      def find_by_email(email)
        ApiClient.do_get "/contacts/v1/contact/email/#{email}/profile"
      end
    end

  end
end
