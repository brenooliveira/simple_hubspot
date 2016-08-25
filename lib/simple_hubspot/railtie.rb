module SimpleHubspot
  class Railtie < Rails::Railtie

    rake_tasks do
      load "tasks/simple_hubspot.rake"
    end

  end
end
