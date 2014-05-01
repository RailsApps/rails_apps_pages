require 'rails/generators'

module Pages
  module Generators
    class AuthorizedGenerator < ::Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      desc "Create pages to accompany a User model when authorization is available."

      def create_page
        ### assumes we are using Devise for authentication
        ### assumes we are using Pundit for authorization
        copy_file 'users/_user.html.erb', 'app/views/users/_user.html.erb'
        copy_file 'users/index.html.erb', 'app/views/users/index.html.erb'
        copy_file 'users/show.html.erb', 'app/views/users/show.html.erb'
        copy_file 'users_controller.rb', 'app/controllers/users_controller.rb'
        copy_file 'user_policy.rb', 'app/policies/user_policy.rb'
        route = '  resources :users'
        inject_into_file 'config/routes.rb', route + "\n", :after => "devise_for :users\n"
        copy_file 'visitors/index.html.erb', 'app/views/visitors/index.html.erb'
        copy_file 'visitors_controller.rb', 'app/controllers/visitors_controller.rb'
        route = '  root :to => "visitors#index"'
        inject_into_file 'config/routes.rb', route + "\n", :after => "routes.draw do\n"
      end

    end
  end
end
