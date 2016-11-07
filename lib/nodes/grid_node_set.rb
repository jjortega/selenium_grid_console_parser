require "json"

module SeleniumGridConsoleParser
  module Nodes
    class GridNodeSet < Set
      def to_json
        jsonObject = {}
        jsonObject["nodes"] = self.to_a.map { |o| Hash[o.to_hash.each_pair.to_a] }
        JSON.pretty_generate(jsonObject)
      end
    end
  end
end
