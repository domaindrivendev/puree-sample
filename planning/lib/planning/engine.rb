module Planning

  class Engine < ::Rails::Engine
    isolate_namespace Planning

    config.generators do |g|
      g.template_engine :slim
      g.helper false
      g.assets false
    end
  end
  
end