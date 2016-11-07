require 'httparty'

module SeleniumGridConsoleParser
  module Nodes
    class GridNodeClient
      def initialize(url)
        @url = url
      end

      def sessions
        response = HTTParty.get("#{@url}/wd/hub/sessions")
        return response.body if response.code == 200
      end
    end
  end
end
