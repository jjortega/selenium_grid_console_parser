require 'nodes/client/grid_node_client'

require 'json'

module SeleniumGridConsoleParser
  module Nodes
    class GridNodeData
      def initialize(node)
        @node = node
      end

      def sessions
        node_client = GridNodeClient.new(@node.remoteHost)
        JSON.parse(node_client.sessions)
      end
    end
  end
end
