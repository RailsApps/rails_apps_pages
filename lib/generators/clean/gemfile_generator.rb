require 'rails/generators'

module Clean
  module Generators
    class GemfileGenerator < ::Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      desc "remove commented lines and multiple blank lines from a Gemfile"

      def clean_gemfile
        gsub_file 'Gemfile', /#.*\n/, "\n"
        gsub_file 'Gemfile', /\n^\s*\n/, "\n"
      end

    end
  end
end
