class Webpacker::RakeTasks
  def self.load!
    tasks_path = File.expand_path("../tasks", __dir__)
    Dir.glob("#{tasks_path}/**/*.rake").sort.each { |ext| load ext }
  end
end
