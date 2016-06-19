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

    attr_accessor :args, :output, :user, :view_partial, :view_template

    def initialize(user, args)
      self.args = args
      self.output = nil
      self.user = user
      self.view_partial = nil
      self.view_template = nil
    end

    def args?
      args.any?
    end

    def run!
      false
    end
  end
end
