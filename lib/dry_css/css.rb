module DryCss
  class CSS
    attr_reader :parser
    def initialize(*uri)
      @parser = DryCss::Parser.new
      uri.each do |u|
        @parser.load_uri!(u)
      end
    end

    def colors
      @colors ||= scan_for(CssParser::RE_COLOUR)
    end

    def sorted(scan)
      scan.sort_by{|k,v| v }.reverse
    end

    private

    def scan_for(property)
      @property = property
      @values_hash = {:counts => Hash.new(0), :total => 0}
      @parser.each_selector do |selector, declarations, specificity|
        declarations.scan(/([\w-]+):[ ]?(#{@property})/) do |prop,val|
          @values_hash[:counts][val.to_sym] += 1
          @values_hash[:total] += 1
        end
      end
      return @values_hash
    end

  end
end
