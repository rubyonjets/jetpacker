binstubs_template_path = File.expand_path("../../install/binstubs.rb", __dir__).freeze

namespace :webpacker do
  desc "Installs Webpacker binstubs in this application"
  task binstubs: [:check_node, :check_yarn] do
    require "rails/generators"
    require "rails/generators/rails/app/app_generator"
    generator = Rails::Generators::AppGenerator.new [Jets.root], {force: ENV['FORCE']}, destination_root: Jets.root
    generator.apply binstubs_template_path, verbose: false
  end
end
