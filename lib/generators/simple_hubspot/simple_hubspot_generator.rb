class SimpleHubspotGenerator < Rails::Generator::Base
  desc "This generator creates an initializer file at config/initializers"
  source_root File.expand_path('../templates', __FILE__)
  namespace 'simple_hubspot'
  def copy_initializer_file
    copy_file "simple_hubspot.rb", "config/initializers/#{file_name}.rb"
  end
end
