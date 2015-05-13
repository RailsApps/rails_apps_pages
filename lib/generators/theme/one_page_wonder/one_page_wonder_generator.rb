require 'rails/generators'

module Theme
  module Generators
    class OnePageWonderGenerator < ::Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      desc "A Bootstrap HTML starter template (from startbootstrap.com)"

      def create_page
        copy_file 'index.html', 'app/views/visitors/index.html.erb'
        copy_file 'one-page-wonder.css', 'app/assets/stylesheets/one-page-wonder.css'
        links = <<-LINKS
<li><%= link_to 'Section 1', '#about' %></li>
<li><%= link_to 'Section 2', '#services' %></li>
<li><%= link_to 'Section 3', '#contact' %></li>
LINKS
        inject_into_file 'app/views/layouts/_navigation_links.html.erb', links, :after => "page_path('about') %></li>\n"
      end

    end
  end
end
