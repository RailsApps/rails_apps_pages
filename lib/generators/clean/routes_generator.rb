require 'rails/generators'

module Clean
  module Generators
    class RoutesGenerator < ::Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      desc "remove commented lines and multiple blank lines from config/routes.rb"

      def clean_gemfile
        gsub_file 'config/routes.rb', /  #.*\n/, "\n"
        gsub_file 'config/routes.rb', /\n^\s*\n/, "\n"
      end

    end
  end
end
