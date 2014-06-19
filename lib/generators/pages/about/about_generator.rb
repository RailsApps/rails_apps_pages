require 'rails/generators'

module Pages
  module Generators
    class AboutGenerator < ::Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      desc "Create an about page (requires the high_voltage gem)"

      def create_page
        generate 'pages:home -f'
        copy_file 'about.html.erb', 'app/views/pages/about.html.erb'
      end

      def add_tests
        return unless File.exists?('spec/spec_helper.rb')
        copy_file 'about_page_spec.rb', 'spec/features/visitors/about_page_spec.rb'
      end

    end
  end
end
