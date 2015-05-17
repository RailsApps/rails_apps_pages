require 'rails/generators'

module Theme
  module Generators
    class TheBigPictureGenerator < ::Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      desc "A Bootstrap HTML starter template (from startbootstrap.com)"

      def create_page
        copy_file 'index.html', 'app/views/visitors/index.html.erb'
        copy_file 'the-big-picture.css', 'app/assets/stylesheets/the-big-picture.css'
        gsub_file 'app/views/layouts/_navigation.html.erb', /navbar-fixed-top/, 'navbar-fixed-bottom'
        gsub_file 'app/views/layouts/application.html.erb', /<html>/, '<html class="full">'
      end

    end
  end
end
