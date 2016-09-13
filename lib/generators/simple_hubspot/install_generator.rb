require 'rails/generators/base'

module SimpleHubspot
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)
      desc "This generator creates an initializer file at config/initializers"
      class_option :orm
      def copy_initializer
        copy_file "simple_hubspot.rb", "config/initializers/simple_hubspot.rb"
      end

    end
  end
end
