require 'rails/generators'

module Analytics
  module Generators
    class SegmentioGenerator < ::Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      desc "add Segment.io tracking to a Rails application"

      def add_segmentio
        copy_file 'segmentio.js', 'app/assets/javascripts/segmentio.js'
      end

    end
  end
end
