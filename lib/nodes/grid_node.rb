require 'nodes/data/grid_node_data'

module SeleniumGridConsoleParser
  module Nodes
    class GridNode
      attr_reader :remoteHost, :configuration

      def initialize(configuration)
        @remoteHost = configuration["remoteHost"]
        @configuration = configuration.delete_if {|key, value| key == "remoteHost"}
      end

      def free?
        sessions = GridNodeData.new(self).sessions
        @free = sessions["value"].size == 0 ? true : false
      end

      def to_hash
        grid_node_hash = self.instance_variables.each_with_object({}) { |var, hash| hash[var.to_s.delete("@")] = self.instance_variable_get(var) }
        grid_node_hash["free"] = free?
        grid_node_hash
      end
    end
  end
end
