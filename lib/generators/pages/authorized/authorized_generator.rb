require 'rails/generators'

module Pages
  module Generators
    class AuthorizedGenerator < ::Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      desc "Add Pundit for authorization. A User model with roles must be available."

      def add_pundit
        copy_file 'pundit.rb', 'config/initializers/pundit.rb'
        copy_file 'users/_user.html.erb', 'app/views/users/_user.html.erb'
      end

      def add_if_devise
        return unless File.exists?('config/initializers/devise.rb')
        copy_file 'devise/users_controller.rb', 'app/controllers/users_controller.rb'
        copy_file 'devise/user_policy.rb', 'app/policies/user_policy.rb'
      end

      def add_if_omniauth
        return unless File.exists?('config/initializers/omniauth.rb')
        copy_file 'omniauth/users_controller.rb', 'app/controllers/users_controller.rb'
        copy_file 'omniauth/user_policy.rb', 'app/policies/user_policy.rb'
      end

    end
  end
end
