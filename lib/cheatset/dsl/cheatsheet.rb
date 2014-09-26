module Cheatset
  module DSL
    class Cheatsheet < Base
      attr_reader :categories, :brand
      define_attrs :title, :docset_file_name, :keyword, :source_url, :platform, :style, :resources, :brand, :logo, :logo_size
      define_markdown_attrs :introduction, :notes

      def initialize(&block)
        @categories = []
        super(&block)
      end

      def category(&block)
        @categories << Cheatset::DSL::Category.new(&block)
      end
    end
  end
end
