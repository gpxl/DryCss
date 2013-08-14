module DryCss
  class CSS
    attr_reader :parser
    def initialize(uri)
      @parser = DryCss::Parser.new
      @parser.load_uri!(uri)
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
      @values_hash = {:counts => {}, :total => 0}
      @parser.each_selector do |selector, declarations, specificity|
        if d_val = declarations.scan(/([\w-]+):[ ]?(#{@property})/)
          d_val.each do |val|
            if @values_hash[:counts][val[1].to_sym].nil?
              @values_hash[:counts].merge!(val[1].to_sym => 1)
            else
              @values_hash[:counts][val[1].to_sym] += 1
            end
            @values_hash[:total] += 1
          end
        end
      end
      return @values_hash
    end

  end
end
