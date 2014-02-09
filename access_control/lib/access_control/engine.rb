module AccessControl
  class Engine < ::Rails::Engine
    isolate_namespace AccessControl

    config.generators do |g|
      g.template_engine :slim
      g.helper false
      g.assets false
    end
  end
end
