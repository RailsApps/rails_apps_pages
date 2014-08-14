require 'rails/generators'

module Pages
  module Generators
    class UsersGenerator < ::Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      desc "Create pages to accompany a User model."

      def create_pages
        copy_file 'users/_user.html.erb', 'app/views/users/_user.html.erb'
        copy_file 'users/index.html.erb', 'app/views/users/index.html.erb'
        copy_file 'users/show.html.erb', 'app/views/users/show.html.erb'
        generate 'pages:home -f'
        copy_file 'visitors/index.html.erb', 'app/views/visitors/index.html.erb'
      end

      def create_devise_pages
        return unless File.exists?('config/initializers/devise.rb')
        copy_file 'devise/users_controller.rb', 'app/controllers/users_controller.rb'
        route = '  resources :users'
        inject_into_file 'config/routes.rb', route + "\n", :after => "devise_for :users\n"
      end

      def create_omniauth_pages
        return unless File.exists?('config/initializers/omniauth.rb')
        copy_file 'omniauth/users_controller.rb', 'app/controllers/users_controller.rb'
        copy_file 'omniauth/_user.html.erb', 'app/views/users/_user.html.erb'
        copy_file 'omniauth/show.html.erb', 'app/views/users/show.html.erb'
        route = '  resources :users'
        inject_into_file 'config/routes.rb', route + "\n", :after => "routes.draw do\n"
      end

      def add_devise_name_field
        return unless File.exists?('config/initializers/devise.rb')
        if Object.const_defined?('User')
          if User.column_names.include? 'name'
            copy_file 'devise/devise_permitted_parameters.rb', 'config/initializers/devise_permitted_parameters.rb'
            prepend_file 'app/views/users/_user.html.erb', "<td><%= link_to user.name, user %></td>\n"
            inject_into_file 'app/views/users/show.html.erb', "\n<p>Name: <%= @user.name if @user.name %></p>", :before => "\n<p>Email"
          end
        end
      end

    end
  end
end
