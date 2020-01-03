install_template_path = File.expand_path("../../install/template.rb", __dir__).freeze

namespace :webpacker do
  desc "Install Webpacker in this application"
  task install: [:check_node, :check_yarn] do
    install_template_path = File.expand_path("../../install/template.rb", __dir__)

    require "rails/generators"
    require "rails/generators/rails/app/app_generator"
    generator = Rails::Generators::AppGenerator.new [Jets.root], {force: ENV['FORCE']}, destination_root: Jets.root
    generator.apply install_template_path, verbose: false
  end
end
