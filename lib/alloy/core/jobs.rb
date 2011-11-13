module Alloy
  module Core
    module Jobs
      private
      def create_job clazz
        job = clazz.new
        job.class.send :include, Alloy::Job::Able

        job
      end
      def get_queue clazz
        queue = clazz.instance_variable_get :@queue unless queue

        raise NameError, "job class does not define a queue attribute" unless queue

        queue
      end
    end
  end
end