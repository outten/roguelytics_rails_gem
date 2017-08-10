
module Roguelytics
  module HasRoguelytics
    extend ActiveSupport::Concern
 
    included do
    end

    private

    module ClassMethods
      def has_roguelytics
        include Roguelytics::HasRoguelytics::LocalInstanceMethods
        if self.respond_to?(:after_commit)
          self.send(:after_commit, on: :create) do
            self.roguelytics_create
          end
          self.send(:after_commit, on: :update) do
            self.roguelytics_update
          end
          self..send(:after_commit, on: :destroy) do
            self.roguelytics_destroy
          end
          true
        end
        true
      end
    end
 
    module LocalInstanceMethods
      def roguelytics_get event, params
        if Rails.env.development?
          Roguelytics::ProcessJob.perform_now event, params
        else
          Roguelytics::ProcessJob.perform_later event, params
        end
      end

      def roguelytics_params
        params = { model_name: self.class.to_s, id: self.id, created_at: "#{self.created_at.to_s}", name: (self.name rescue nil) }
      end

      def roguelytics_create
        self.roguelytics_get 'create', roguelytics_params
      end

      def roguelytics_update
        self.roguelytics_get 'update', roguelytics_params
      end

      def roguelytics_delete
        self.roguelytics_get 'delete', roguelytics_params
      end
    end
  end
end
