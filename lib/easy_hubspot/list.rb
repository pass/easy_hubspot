# frozen_string_literal: true

module EasyHubspot
  # class EasyHubspot::Contact
  class List < EasyHubspot::Base
    class << self
      LIST_ENDPOINT = 'crm/v3/lists'

      # def get_list(list_id)
      #   Client.do_get(list_id_endpoint(list_id), headers)
      # end

      def get_lists
        Client.do_get(LIST_ENDPOINT, headers)
      end

      # def create_list(body)
      #   Client.do_post(LIST_ENDPOINT, body, headers)
      # end

      # def update_list(list_id, body)
      #   Client.do_patch(list_id_endpoint(list_id), body, headers)
      # end

      # def delete_list(list_id)
      #   Client.do_delete(list_id_endpoint(list_id), headers)
      # end

      def create_list_membership(list_id, body)
        membership_endpoint = "#{list_id_endpoint(list_id)}/memberships/add"
        Client.do_put(membership_endpoint, body, headers)
      end


      private

      def list_id_endpoint(list_id)
        "#{LIST_ENDPOINT}/#{list_id}"
      end
    end
  end
end
