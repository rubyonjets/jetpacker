class Webpacker::Instance
  cattr_accessor(:logger) { ActiveSupport::TaggedLogging.new(ActiveSupport::Logger.new(STDOUT)) }

  attr_reader :root_path, :config_path

  def initialize(root_path: Jets.root, config_path: Jets.root.join("config/webpacker.yml"))
    @root_path, @config_path = root_path, config_path
  end

  def env
    (ENV["NODE_ENV"].presence_in(available_environments) ||
      Jets.env.presence_in(available_environments) ||
        "production".freeze).inquiry
  end

  def config
    @config ||= Webpacker::Configuration.new self
  end

  def compiler
    @compiler ||= Webpacker::Compiler.new self
  end

  def dev_server
    @dev_server ||= Webpacker::DevServer.new self
  end

  def manifest
    @manifest ||= Webpacker::Manifest.new self
  end

  def commands
    @commands ||= Webpacker::Commands.new self
  end

  private
    def available_environments
      if config_path.exist?
        YAML.load(config_path.read).keys
      else
        [].freeze
      end
    end
end
