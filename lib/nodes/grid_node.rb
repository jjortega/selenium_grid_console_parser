module SeleniumGridConsoleParser
  module Nodes
    class GridNode
      attr_reader :remoteHost, :configuration, :capabilities

      def initialize(configuration)
        @remoteHost = configuration["remoteHost"]
        @configuration = configuration.delete_if {|key, value| key == "remoteHost"}
      end

      def free?
        true #TODO: Implement the method
      end

      def to_hash
        self.instance_variables.each_with_object({}) { |var, hash| hash[var.to_s.delete("@")] = self.instance_variable_get(var) }
      end
    end
  end
end
