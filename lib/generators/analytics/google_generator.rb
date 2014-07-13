require 'rails/generators'

module Analytics
  module Generators
    class GoogleGenerator < ::Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      desc "add Google Analytics to a Rails application"

      def add_google_analytics
        copy_file 'google_analytics.js.coffee', 'app/assets/javascripts/google_analytics.js.coffee'
      end

    end
  end
end
