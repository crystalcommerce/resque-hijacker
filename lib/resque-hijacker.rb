require 'resque'
require 'resque/job'

module Resque
  class Job
    class << self
      def create(queue, klass, *args)
        Resque.validate(klass, queue)

        if Resque.inline?
          constantize(klass).perform(*decode(encode(args)))
        else
          Resque.push(queue, :class    => klass.to_s,
                             :args     => args,
                             :database => Hijacker.current_client)
        end
      end
    end

    alias_method :perform_without_hijacking, :perform
    def perform
      if database.present?
        Hijacker.connect_to_master database
      end

      perform_without_hijacking
    end

    def database
      @payload['database']
    end
  end
end
