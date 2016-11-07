require "json"

module SeleniumGridConsoleParser
  module Nodes
    class GridNodeSet < Set
      def to_json
        JSON.pretty_generate(to_hash)
      end

      def to_hash
        hashObject = {}
        hashObject["nodes"] = self.to_a.map { |o| Hash[o.to_hash.each_pair.to_a] }
      end
    end
  end
end
