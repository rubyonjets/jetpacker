require "webpacker/helper"
require "webpacker/dev_server_proxy"
require "jets"

module Webpacker
  class Turbine < ::Jets::Turbine
    initializer "webpacker.set_configs" do |app|
      # Allows Webpacker config values to be set via Jets env config files
      app.config.webpacker ||= ActiveSupport::OrderedOptions.new # TODO: all config access outside initializer block
    end

    # TODO: add support load middleware in a Turbine
    # initializer "webpacker.proxy" do |app|
    #   insert_middleware = Webpacker.config.dev_server.present? rescue nil
    #   if insert_middleware
    #     app.middleware.insert_before 0, Webpacker::DevServerProxy
    #   end
    # end

    initializer "webpacker.helper" do
      ActiveSupport.on_load :action_controller do
        ActionController::Base.helper Webpacker::Helper
      end

      ActiveSupport.on_load :action_view do
        include Webpacker::Helper
      end
    end

    initializer "webpacker.set_source" do |app|
      if Webpacker.config.config_path.exist?
        app.config.javascript_path = Webpacker.config.source_path.relative_path_from(Jets.root.join("app")).to_s
      end
    end
  end
end
