module DryCss
  class CSS
    attr_reader :parser
    def initialize(uri)
      @parser = DryCss::Parser.new
      @parser.load_uri!(uri)
    end

    def colors
      @values_hash = {}
      @parser.each_selector do |selector, declarations, specificity|
        if d_val = declarations.scan(/([\w-]+):[ ]?([\w\d]+);/)
          d_val.each do |val|
            if @values_hash[val[1]].nil?
              @values_hash[val[1]] = 1
            else
              @values_hash[val[1]] += 1
            end
          end
        end
      end

      return @values_hash.sort_by{|key,val| val}.reverse
    end
  end
end
