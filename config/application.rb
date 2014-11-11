require File.expand_path('../boot', __FILE__)

require 'rails/all'
Bundler.require(*Rails.groups)

module Hyacinth
  class Application < Rails::Application
    config.time_zone = 'Beijing'
    config.i18n.default_locale = :'zh-CN'
    config.i18n.enforce_available_locales = false
    config.action_controller.allow_forgery_protection = false
    config.action_view.field_error_proc = Proc.new { |html_tag, instance| "#{html_tag}".html_safe }
    config.generators do |g|
      g.test_framework :rspec,
        fixtures: true,
        view_specs: false,
        helper_specs: false,
        routing_specs: true,
        controller_specs: true,
        request_specs: false
    end
  end
end
