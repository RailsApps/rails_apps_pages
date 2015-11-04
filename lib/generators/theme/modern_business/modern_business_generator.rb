require 'rails/generators'

module Theme
  module Generators
    class ModernBusinessGenerator < ::Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      desc "A Bootstrap HTML starter template (from startbootstrap.com)"

      def create_page
        copy_file 'application.html.erb', 'app/views/layouts/application.html.erb'
        copy_file 'footer.html', 'app/views/layouts/_footer.html.erb'
        copy_file 'index.html', 'app/views/visitors/index.html.erb'
        copy_file '404.html', 'app/views/pages/404.html.erb'
        remove_file 'app/views/pages/about.html.erb'
        copy_file 'about.html', 'app/views/pages/about.html.erb'
        copy_file 'blog-home-1.html', 'app/views/pages/blog-home-1.html.erb'
        copy_file 'blog-home-2.html', 'app/views/pages/blog-home-2.html.erb'
        copy_file 'blog-post.html', 'app/views/pages/blog-post.html.erb'
        copy_file 'contact.html', 'app/views/pages/contact.html.erb'
        copy_file 'faq.html', 'app/views/pages/faq.html.erb'
        copy_file 'full-width.html', 'app/views/pages/full-width.html.erb'
        copy_file 'portfolio-1-col.html', 'app/views/pages/portfolio-1-col.html.erb'
        copy_file 'portfolio-2-col.html', 'app/views/pages/portfolio-2-col.html.erb'
        copy_file 'portfolio-3-col.html', 'app/views/pages/portfolio-3-col.html.erb'
        copy_file 'portfolio-4-col.html', 'app/views/pages/portfolio-4-col.html.erb'
        copy_file 'portfolio-item.html', 'app/views/pages/portfolio-item.html.erb'
        copy_file 'pricing.html', 'app/views/pages/pricing.html.erb'
        copy_file 'services.html', 'app/views/pages/services.html.erb'
        copy_file 'sidebar.html', 'app/views/pages/sidebar.html.erb'
        copy_file 'modern-business.css', 'app/assets/stylesheets/modern-business.css'
        inject_into_file 'app/views/layouts/_navigation_links.html.erb', add_links, :after => "page_path('about') %></li>\n"
        gsub_file 'app/views/layouts/_navigation.html.erb', /nav navbar-nav/, 'nav navbar-nav navbar-right'
      end

      def add_links
        links = <<-LINKS
        <li>
            <%= link_to 'Services', page_path('services') %>
        </li>
        <li>
            <%= link_to 'Contact', page_path('contact') %>
        </li>
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Portfolio <b class="caret"></b></a>
            <ul class="dropdown-menu">
                <li>
                    <%= link_to '1 Column Portfolio', page_path('portfolio-1-col') %>
                </li>
                <li>
                    <%= link_to '2 Column Portfolio', page_path('portfolio-2-col') %>
                </li>
                <li>
                    <%= link_to '3 Column Portfolio', page_path('portfolio-3-col') %>
                </li>
                <li>
                    <%= link_to '4 Column Portfolio', page_path('portfolio-4-col') %>
                </li>
                <li>
                    <%= link_to 'Single Portfolio Item', page_path('portfolio-item') %>
                </li>
            </ul>
        </li>
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Blog <b class="caret"></b></a>
            <ul class="dropdown-menu">
                <li>
                    <%= link_to 'Blog Home 1', page_path('blog-home-1') %>
                </li>
                <li>
                    <%= link_to 'Blog Home 2', page_path('blog-home-2') %>
                </li>
                <li>
                    <%= link_to 'Blog Post', page_path('blog-post') %>
                </li>
            </ul>
        </li>
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Other Pages <b class="caret"></b></a>
            <ul class="dropdown-menu">
                <li>
                    <%= link_to 'Full Width Page', page_path('full-width') %>
                </li>
                <li>
                    <%= link_to 'Sidebar Page', page_path('sidebar') %>
                </li>
                <li>
                    <%= link_to 'FAQ', page_path('faq') %>
                </li>
                <li>
                    <%= link_to '404', page_path('404') %>
                </li>
                <li>
                    <%= link_to 'Pricing Table', page_path('pricing') %>
                </li>
            </ul>
        </li>
        LINKS
      end

    end
  end
end
