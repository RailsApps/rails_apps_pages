require 'rails/generators'

module Theme
  module Generators
    class HeroicFeaturesGenerator < ::Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      desc "A Bootstrap HTML starter template (from startbootstrap.com)"

      def create_page
        copy_file 'index.html', 'app/views/visitors/index.html.erb'
        copy_file 'heroic-features.css', 'app/assets/stylesheets/heroic-features.css'
      end

    end
  end
end
