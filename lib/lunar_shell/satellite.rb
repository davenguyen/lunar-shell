module LunarShell
  class Satellite
    class << self
      def [](command, *args)
        klass(command).new(args) rescue nil
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

    attr_accessor :args

    def initialize(*args)
      self.args = args
    end
  end
end
