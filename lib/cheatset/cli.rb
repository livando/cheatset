require 'thor'

module Rouge
    module Formatters
        class HTML < Formatter
            def stream_untableized(tokens, &b)
              yield "<pre#@css_class>" if @wrap
              tokens.each{ |tok, val| span(tok, val, &b) }
              yield "</pre>\n" if @wrap
            end
        end
    end
end

module Cheatset
  class CLI < Thor
    desc 'generate FILE', 'Generates cheatsheet out of a file'
    def generate(file, brand='ric')
      context = Cheatset::DSL::Context.new(file, brand)
      context.generate
    end
  end
end
