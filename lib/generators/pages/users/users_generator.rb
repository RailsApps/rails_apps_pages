require 'rails/generators'

module Pages
  module Generators
    class UsersGenerator < ::Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      desc "Create pages to accompany a User model when authentication is available."

      def create_page
        ### assumes we are using Devise for authentication
        copy_file 'users/_user.html.erb', 'app/views/users/_user.html.erb'
        copy_file 'users/index.html.erb', 'app/views/users/index.html.erb'
        copy_file 'users/show.html.erb', 'app/views/users/show.html.erb'
        copy_file 'users_controller.rb', 'app/controllers/users_controller.rb'
        route = '  resources :users'
        inject_into_file 'config/routes.rb', route + "\n", :after => "devise_for :users\n"
        copy_file 'registrations_controller.rb', 'app/controllers/registrations_controller.rb'
        gsub_file 'config/routes.rb', /devise_for :users/, 'devise_for :users, :controllers => {:registrations => "registrations"}'
        generate 'pages:home -f'
        copy_file 'visitors/index.html.erb', 'app/views/visitors/index.html.erb'
      end

      def add_tests
        return unless File.exists?('spec/spec_helper.rb')
        copy_file 'spec/factories/users.rb', 'spec/factories/users.rb'
        copy_file 'spec/features/users/log_in_spec.rb', 'spec/features/users/log_in_spec.rb'
        copy_file 'spec/features/users/log_out_spec.rb', 'spec/features/users/log_out_spec.rb'
        copy_file 'spec/features/users/user_delete_spec.rb', 'spec/features/users/user_delete_spec.rb'
        copy_file 'spec/features/users/user_edit_spec.rb', 'spec/features/users/user_edit_spec.rb'
        copy_file 'spec/features/users/user_index_spec.rb', 'spec/features/users/user_index_spec.rb'
        copy_file 'spec/features/users/user_show_spec.rb', 'spec/features/users/user_show_spec.rb'
        copy_file 'spec/features/visitors/sign_up_spec.rb', 'spec/features/visitors/sign_up_spec.rb'
        copy_file 'spec/models/user_spec.rb', 'spec/models/user_spec.rb'
        copy_file 'spec/support/helpers/session_helpers.rb', 'spec/support/helpers/session_helpers.rb'
        copy_file 'spec/support/helpers.rb', 'spec/support/helpers.rb'
      end

    end
  end
end
