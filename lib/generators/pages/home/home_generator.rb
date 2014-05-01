require 'rails/generators'

module Pages
  module Generators
    class HomeGenerator < ::Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      desc "Create a home page"

      def create_page
        copy_file 'index.html.erb', 'app/views/home/index.html.erb'
        copy_file 'home_controller.rb', 'app/controllers/home_controller.rb'
      end

    end
  end
end
