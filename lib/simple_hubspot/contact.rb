module SimpleHubspot
  class Contact

    class << self

      def create_or_update(email, params)
        ApiClient.do_post "/contacts/v1/contact/createOrUpdate/email", Utils.hash_to_properties(params)
      end

    end

  end
end
