module Alloy
  module Core
    module RunOnce
      def run_once *arguments
        arguments = hash_arguments arguments

        executor = get_executor(get_limit arguments[:queue])
        job = create_job arguments[:clazz]

        executor.submit job
      end
    end
  end
end