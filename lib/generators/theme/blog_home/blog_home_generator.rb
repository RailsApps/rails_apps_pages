require 'rails/generators'

module Theme
  module Generators
    class BlogHomeGenerator < ::Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      desc "A Bootstrap HTML starter template (from startbootstrap.com)"

      def create_page
        copy_file 'index.html', 'app/views/visitors/index.html.erb'
        copy_file 'blogpost.html', 'app/views/pages/blogpost.html.erb'
        copy_file 'blog-home.css', 'app/assets/stylesheets/blog-home.css'
      end

    end
  end
end
