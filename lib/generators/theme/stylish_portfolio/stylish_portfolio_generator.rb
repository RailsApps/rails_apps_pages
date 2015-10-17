require 'rails/generators'

module Theme
  module Generators
    class StylishPortfolioGenerator < ::Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      desc "A Bootstrap HTML starter template (from startbootstrap.com)"

      def create_page
        copy_file 'application.html.erb', 'app/views/layouts/application.html.erb'
        copy_file 'index.html', 'app/views/visitors/index.html.erb'
        copy_file 'stylish-portfolio.css', 'app/assets/stylesheets/stylish-portfolio.css'
      end

    end
  end
end
