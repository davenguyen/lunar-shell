module LunarShell
  class Satellite
    class << self
      def [](command, *args)
        klass(command).new(args) rescue nil
      end

      private

      def klass(command)
        "LunarShell::#{command.classify}Satellite".constantize
      end
    end

    attr_accessor :args

    def initialize(*args)
      self.args = args
    end
  end
end
