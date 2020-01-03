installers = {
  "Angular": :angular,
  "Elm": :elm,
  "React": :react,
  "Vue": :vue,
  "Erb": :erb,
  "Coffee": :coffee,
  "Typescript": :typescript,
  "Svelte": :svelte,
  "Stimulus": :stimulus
}.freeze

dependencies = {
  "Angular": [:typescript]
}

namespace :webpacker do
  namespace :install do
    installers.each do |name, task_name|
      desc "Install everything needed for #{name}"
      task task_name => ["webpacker:verify_install"] do
        require "rails/generators"
        require "rails/generators/rails/app/app_generator"
        generator = Rails::Generators::AppGenerator.new [Jets.root], {force: ENV['FORCE']}, destination_root: Jets.root

        template = File.expand_path("../install/#{task_name}.rb", __dir__)
        generator.apply template, verbose: false

        dependencies[name] ||= []
        dependencies[name].each do |dependency|
          dependency_template = File.expand_path("../install/#{dependency}.rb", __dir__)
          generator.apply dependency_template, verbose: false
        end
      end
    end
  end
end
