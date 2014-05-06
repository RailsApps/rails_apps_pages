require 'rails/generators'

module Pages
  module Generators
    class AuthorizedGenerator < ::Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      desc "Create pages to accompany a User model when authorization is available."

      def create_page
        ### assumes we are using Devise for authentication
        ### assumes we are using Pundit for authorization
        generate 'pages:users -f'
        copy_file 'users/_user.html.erb', 'app/views/users/_user.html.erb'
        copy_file 'users_controller.rb', 'app/controllers/users_controller.rb'
        copy_file 'user_policy.rb', 'app/policies/user_policy.rb'
      end

    end
  end
end
