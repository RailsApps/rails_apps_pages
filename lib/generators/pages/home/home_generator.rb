require 'rails/generators'

module Pages
  module Generators
    class HomeGenerator < ::Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      desc "Create a home page"

      def create_page
        copy_file 'index.html.erb', 'app/views/visitors/index.html.erb'
        copy_file 'home_controller.rb', 'app/controllers/visitors_controller.rb'
        route = '  root :to => "visitors#index"'
        inject_into_file 'config/routes.rb', route + "\n", :after => "routes.draw do\n"
      end

    end
  end
end
