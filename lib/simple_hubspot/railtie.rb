module SimpleHubspot
  class Railtie < Rails::Railtie

    rake_tasks do
      load "task/simple_hubspot.rake"
    end

  end
end
