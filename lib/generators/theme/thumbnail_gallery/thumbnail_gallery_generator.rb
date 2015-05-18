require 'rails/generators'

module Theme
  module Generators
    class ThumbnailGalleryGenerator < ::Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      desc "A Bootstrap HTML starter template (from startbootstrap.com)"

      def create_page
        copy_file 'index.html', 'app/views/visitors/index.html.erb'
        copy_file 'thumbnail-gallery.css', 'app/assets/stylesheets/thumbnail-gallery.css'
      end

    end
  end
end
