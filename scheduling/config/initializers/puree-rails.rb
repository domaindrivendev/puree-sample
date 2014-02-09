require 'puree'

# Auto register event listeners
Dir["#{File.dirname(__FILE__)}/../../app/listeners/**/*.rb"].each { |f| load(f) }

ObjectSpace.each_object(Class) do |klass|
  if klass.superclass == Puree::EventListener
    Puree::EventDispatcher.instance.register(klass.new)
  end
end