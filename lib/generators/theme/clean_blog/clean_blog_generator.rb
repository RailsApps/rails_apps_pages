require 'rails/generators'

module Theme
  module Generators
    class CleanBlogGenerator < ::Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      desc "A Bootstrap HTML starter template (from startbootstrap.com)"

      def create_page
        copy_file 'application.html.erb', 'app/views/layouts/application.html.erb'
        copy_file 'footer.html', 'app/views/layouts/_footer.html.erb'
        copy_file '_navigation.html.erb', 'app/views/layouts/_navigation.html.erb'
        copy_file '_navigation_links.html.erb', 'app/views/layouts/_navigation_links.html.erb'
        copy_file 'index.html', 'app/views/visitors/index.html.erb'
        copy_file 'about.html', 'app/views/pages/about.html.erb'
        copy_file 'contact.html', 'app/views/pages/contact.html.erb'
        copy_file 'post.html', 'app/views/pages/post.html.erb'
        copy_file 'clean-blog.css', 'app/assets/stylesheets/clean-blog.css'
      end

      def modify_layout_for_auth_links
        return unless File.exists?('app/views/layouts/_nav_links_for_auth.html.erb')
        partial = "<%= render 'layouts/navigation_links' %>\n        <%= render 'layouts/nav_links_for_auth' %>"
        gsub_file "app/views/layouts/_navigation.html.erb", /<%= render 'layouts\/navigation_links' %>/, partial
      end

    end
  end
end
