class Camera
  attr_accessor :dir, :step

  def initialize(test_case)
    self.dir = test_case.strip.gsub(/[^\w]/, '_')
    self.step = 1
  end

  def takephoto(name = nil)
    filename = [step, name].compact.join("_") + ".png"
    filepath = File.join(screenshot_directory, dir, filename)
    Capybara.current_session.save_screenshot(filepath)
    self.step += 1
  end

  private

  def screenshot_directory
    @screenshot_dir ||= ENV.fetch("screenshot_dir"){ Dir.mktmpdir("qatask-screenshots") }
  end
end

RSpec.configure do |config|
  config.before(:each) do |group|
    @camera = Camera.new(group.example.metadata[:full_description])
  end
end
