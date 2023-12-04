# frozen_string_literal: true

module EasyHubspot
  class List < EasyHubspot::Base
    class << self
      LIST_ENDPOINT = 'crm/v3/lists'

      # Add Records to List call: https://developers.hubspot.com/docs/api/crm/lists
      # contact_ids must be either an array or a string/integer of a Contact ID
      def create_list_membership(list_id, contact_ids)
        membership_endpoint = "#{list_id_endpoint(list_id)}/memberships/add"

        # for some reason this endpoint doesnt accept a JSON object, just
        # a stringified array of Contact IDs
        body =
          if contact_ids.is_a?(Array)
            contact_ids.to_s
          else
            "[#{contact_ids}]"
          end

        Client.do_put(membership_endpoint, body, headers)
      end

      private

      def list_id_endpoint(list_id)
        "#{LIST_ENDPOINT}/#{list_id}"
      end
    end
  end
end
