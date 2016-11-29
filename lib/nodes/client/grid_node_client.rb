require 'httparty'

module SeleniumGridConsoleParser
  module Nodes
    class GridNodeClient
      def initialize(url)
        @url = url
      end

      def sessions
        begin
          response = HTTParty.get("#{@url}/wd/hub/sessions", timeout: 10)
        rescue Net::ReadTimeout
          raise NodeDownException
        end
        return response.body if response.code == 200
      end
    end

    class NodeDownException < Exception; end
  end
end
