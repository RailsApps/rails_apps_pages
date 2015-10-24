require 'rails/generators'

module Theme
  module Generators
    class PortfolioItemGenerator < ::Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      desc "A Bootstrap HTML starter template (from startbootstrap.com)"

      def create_page
        copy_file 'index.html', 'app/views/visitors/index.html.erb'
        copy_file 'portfolio-item.css', 'app/assets/stylesheets/portfolio-item.css'
      end

    end
  end
end
