module LunarShell
  class Satellite
    class << self
      def [](command, user, args)
        klass(command).new(user, args) rescue nil
      end

      def all
        satellites_dir.map {|f| File.basename(f, '_satellite.rb') }
      end

      private

      def klass(command)
        "LunarShell::#{command.classify}Satellite".constantize
      end

      def satellites_dir
        Dir[LunarShell::Engine.root + 'app/satellites/lunar_shell/*.rb']
      end
    end

    attr_accessor :args, :user

    def initialize(user, args)
      self.user = user
      self.args = args
    end

    def args?
      args.any?
    end
  end
end
