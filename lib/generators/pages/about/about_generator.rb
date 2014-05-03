require 'rails/generators'

module Pages
  module Generators
    class AboutGenerator < ::Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      desc "Create an about page (requires the high_voltage gem)"

      def create_page
        copy_file 'about.html.erb', 'app/views/pages/about.html.erb'
      end

    end
  end
end
