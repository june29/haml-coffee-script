require 'haml'
require 'haml/filters'

module Haml
  module Filters
    module Coffee
      include Base
      lazy_require 'coffee-script'

      def compile(compiler, text)
        compiled = CoffeeScript.compile(text)
        rendered = "<script>\n//<![CDATA[\n#{compiled}\n//]]>\n</script>"
        compiler.instance_eval do
          push_text(options[:ugly] ?
                    rendered.rstrip :
                    rendered.rstrip.gsub("\n", "\n#{'  ' * @output_tabs}"))
        end
      end
    end
  end
end
