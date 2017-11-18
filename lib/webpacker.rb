# webpack relies on rails which uses these core_ext but since
# we're not entirely requiring rails we need to require all the core_ext
# individually, yeah a bit of a pain
require "active_support/core_ext/object"
require "active_support/core_ext/hash"
require "active_support/core_ext/module/attribute_accessors"
require "active_support/logger"
require "active_support/tagged_logging"

module Webpacker
  extend self

  def instance=(instance)
    @instance = instance
  end

  def instance
    @instance ||= Webpacker::Instance.new
  end

  delegate :logger, :logger=, :env, to: :instance
  delegate :config, :compiler, :manifest, :commands, :dev_server, to: :instance
  delegate :bootstrap, :clobber, :compile, to: :commands
end

require "webpacker/instance"
require "webpacker/configuration"
require "webpacker/manifest"
require "webpacker/compiler"
require "webpacker/commands"
require "webpacker/dev_server"
require "webpacker/rake_tasks"
