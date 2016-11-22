require 'nodes/configuration/capabilities'

module SeleniumGridConsoleParser
  module GridNode
    class GridNodeConfiguration < Hash
      def self.build(configuration_html_elements)
        configuration = {}
        configuration_html_elements.each do |parameter_html_element|
          parameter = parameter_html_element.text.split(": ")
          if parameter[0] != "capabilities"
            configuration[parameter[0]] = parameter[1]
          else
            configuration[parameter[0]] = Capabilities.build(parameter[1])
          end
        end
        GridNodeConfiguration[configuration]
      end
    end
  end
end