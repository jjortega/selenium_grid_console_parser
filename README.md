# Selenium-Grid-Parser

Selenium-Grid doesn't have a pretty API so this gem is for parser the result of 
/grid/console to know which nodes are free to use them when running your tests

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'selenium-grid-parser'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install selenium-grid-parser

## Usage

### Script

     bin/parse -u [selenium-grid-url] -o [json|hash]
        -u: The selenium-grid-url (By default: 'http://0.0.0.0:4444')
        -o: The output format (By default: hash)

Example:
    
    bin/parse -u http://0.0.0.0:4444 -o json
    
It will return:

        [
          {
            "remoteHost": "http://0.0.0.0:4725",
            "configuration": {
              "browserTimeout": "0",
              "debug": "false",
              "help": "false",
              "jettyMaxThreads": "-1",
              "port": "4725",
              "role": "node",
              "timeout": "30000",
              "cleanUpCycle": "2000",
              "host": "0.0.0.0",
              "maxSession": "6",
              "capabilities": {
                "browserName": "Samsung S6",
                "platformName": "ANDROID",
                "maxInstances": "1",
                "applicationName": "Samsung S6"
              },
              "id": "http://0.0.0.0:4725",
              "hubHost": "0.0.0.0",
              "hubPort": "4444",
              "nodeStatusCheckTimeout": "5000",
              "proxy": "org.openqa.grid.selenium.proxy.DefaultRemoteProxy",
              "register": "true",
              "registerCycle": "5000"
            },
            "free": true
          },
          {
            "remoteHost": "http://0.0.0.0:4726",
            "configuration": {
              "browserTimeout": "0",
              "debug": "false",
              "help": "false",
              "jettyMaxThreads": "-1",
              "port": "4726",
              "role": "node",
              "timeout": "30000",
              "cleanUpCycle": "2000",
              "host": "0.0.0.0",
              "maxSession": "6",
              "capabilities": {
                "browserName": "Nexus5",
                "platformName": "ANDROID",
                "maxInstances": "1",
                "applicationName": "Nexus5"
              },
              "id": "http://0.0.0.0:4726",
              "hubHost": "0.0.0.0",
              "hubPort": "4444",
              "nodeStatusCheckTimeout": "5000",
              "proxy": "org.openqa.grid.selenium.proxy.DefaultRemoteProxy",
              "register": "true",
              "registerCycle": "5000"
            },
            "free": true
          }
        ]

### Lib

Easy, just call:
    
    selenium_grid_url = "http://0.0.0.0:4444"   
    nodes = SeleniumGridConsoleParser.nodes(selenium_grid_url)
    
It will return a node_set.

    nodes.free_nodes #It'll return all nodes that aren't been used.
    node_available = nodes.first_free_node #It'll return the first free node available
    nodes.to_json =>
        [
          {
            "remoteHost": "http://0.0.0.0:4725",
            "configuration": {
              "browserTimeout": "0",
              "debug": "false",
              "help": "false",
              "jettyMaxThreads": "-1",
              "port": "4725",
              "role": "node",
              "timeout": "30000",
              "cleanUpCycle": "2000",
              "host": "0.0.0.0",
              "maxSession": "6",
              "capabilities": {
                "browserName": "Samsung S6",
                "platformName": "ANDROID",
                "maxInstances": "1",
                "applicationName": "Samsung S6"
              },
              "id": "http://0.0.0.0:4725",
              "hubHost": "0.0.0.0",
              "hubPort": "4444",
              "nodeStatusCheckTimeout": "5000",
              "proxy": "org.openqa.grid.selenium.proxy.DefaultRemoteProxy",
              "register": "true",
              "registerCycle": "5000"
            },
            "free": true
          },
          {
            "remoteHost": "http://0.0.0.0:4726",
            "configuration": {
              "browserTimeout": "0",
              "debug": "false",
              "help": "false",
              "jettyMaxThreads": "-1",
              "port": "4726",
              "role": "node",
              "timeout": "30000",
              "cleanUpCycle": "2000",
              "host": "0.0.0.0",
              "maxSession": "6",
              "capabilities": {
                "browserName": "Nexus5",
                "platformName": "ANDROID",
                "maxInstances": "1",
                "applicationName": "Nexus5"
              },
              "id": "http://0.0.0.0:4726",
              "hubHost": "0.0.0.0",
              "hubPort": "4444",
              "nodeStatusCheckTimeout": "5000",
              "proxy": "org.openqa.grid.selenium.proxy.DefaultRemoteProxy",
              "register": "true",
              "registerCycle": "5000"
            },
            "free": true
          }
        ]

And if we only have a node...

    node.free? #It'll return if the node is available or not
    node.to_hash =>
    
        {
         "remoteHost"=>"http://0.0.0.0:4726", 
         "configuration"=> {
            "browserTimeout"=>"0",
            "debug"=>"false",
            "help"=>"false",
            "jettyMaxThreads"=>"-1",
            "port"=>"4726",
            "role"=>"node",
            "timeout"=>"30000",
            "cleanUpCycle"=>"2000", "host"=>"0.0.0.0",
            "maxSession"=>"6",
            "capabilities"=>{
                "browserName"=>"Chrome",
                "maxInstances"=>"1",
                "applicationName"=>"Nexus5"},
            "id"=>"http://0.0.0.0:4726",
            "hubHost"=>"0.0.0.0",
            "hubPort"=>"4444",
            "nodeStatusCheckTimeout"=>"5000",
            "proxy"=>"org.openqa.grid.selenium.proxy.DefaultRemoteProxy",
            "register"=>"true", "registerCycle"=>"5000"},
            "free"=>true
         }

    

## Contributing

1. Fork it ( https://github.com/jjortega/selenium-grid-parser/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
