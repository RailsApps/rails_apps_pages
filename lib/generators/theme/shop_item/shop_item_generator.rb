require 'rails/generators'

module Theme
  module Generators
    class ShopItemGenerator < ::Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      desc "A Bootstrap HTML starter template (from startbootstrap.com)"

      def create_page
        copy_file 'index.html', 'app/views/visitors/index.html.erb'
        copy_file 'shop-item.css', 'app/assets/stylesheets/shop-item.css'
      end

    end
  end
end
