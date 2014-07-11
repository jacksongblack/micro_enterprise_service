# -*- coding: utf-8 -*-
require File.expand_path('../boot', __FILE__)

require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"


Bundler.require(:default, Rails.env)

# -*- coding: utf-8 -*-
module MicroEnterpriseService
  class Application < Rails::Application
    # config.time_zone = 'Central Time (US & Canada)'
    config.i18n.default_locale = :zh_CN

    config.assets.paths << Rails.root.join("lib")
    #config.autoload_paths += %W(#{config.root}/app/models/ckeditor)

    config.paths.add "app/api", glob: "**/*.rb"
    config.autoload_paths += Dir["#{Rails.root}/app/api/*"]

    config.generators do |g|
      g.factory_girl dir: "#{::Rails.root}/spec/factories"
    end
    
    # ActsAsTaggableOn config
    ActsAsTaggableOn.remove_unused_tags = true
    ActsAsTaggableOn.force_lowercase = true
    ActsAsTaggableOn.delimiter = [',','，']
  end
end
