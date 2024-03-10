RSpec.configure do |config|
  include Committee::Rails::Test::Methods

  config.add_setting :committee_options
  config.committee_options = {
    schema_path: Rails.root.join("openapi.yml").to_s,
    prefix: "/api/v1"
  }
end
