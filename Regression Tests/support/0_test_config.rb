
def test_config
  @config ||= read_config('env.conf')
end

def read_config(config_file)
  env = ENV.fetch("test_env"){ "dev" }
  config = ParseConfig.new(config_file)
  config['default'].merge(config[env])
end
