require 'rails/generators'

module Pages
  module Generators
    class RolesGenerator < ::Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      desc "Simple role-based authorization. A User model with roles must be available."

      def add_users_partial
        copy_file 'users/_user.html.erb', 'app/views/users/_user.html.erb'
      end

      def add_if_devise
        return unless File.exists?('config/initializers/devise.rb')
        copy_file 'devise/users_controller.rb', 'app/controllers/users_controller.rb'
      end

      def add_if_omniauth
        return unless File.exists?('config/initializers/omniauth.rb')
        copy_file 'omniauth/users_controller.rb', 'app/controllers/users_controller.rb'
      end

    end
  end
end
