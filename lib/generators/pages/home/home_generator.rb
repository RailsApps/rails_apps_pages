require 'rails/generators'

module Pages
  module Generators
    class HomeGenerator < ::Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      desc "Create a home page"

      def create_page
        return if File.exists?('app/views/visitors/index.html.erb')
        copy_file 'index.html.erb', 'app/views/visitors/index.html.erb'
        copy_file 'visitors_controller.rb', 'app/controllers/visitors_controller.rb'
        route = "  root to: 'visitors#index'"
        inject_into_file 'config/routes.rb', route + "\n", :after => "routes.draw do\n"
      end

      def add_tests
        return unless File.exists?('spec/spec_helper.rb')
        copy_file 'home_page_spec.rb', 'spec/features/visitors/home_page_spec.rb'
      end

    end
  end
end
