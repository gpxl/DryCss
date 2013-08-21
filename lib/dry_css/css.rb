module DryCss
  class CSS
    attr_reader :parser
    def initialize(*uris)
      @parser = load_uris(uris)
    end

    def colors
      @colors ||= scan_for(CssParser::RE_COLOUR)
    end

    def sorted(scan)
      scan.sort_by{|k,v| v }.reverse
    end

    private

    def load_uris(uris)
      parser = DryCss::Parser.new
      threads = []
      uris.each do |u|
        threads << Thread.new(u) do |uri|
          begin
            parser.load_uri!(uri)
          rescue CssParser::RemoteFileError
          end
        end
      end
      threads.each{|thr| thr.join }
      return parser
    end

    def scan_for(property)
      values_hash = {:counts => Hash.new(0), :total => 0}
      @parser.each_selector do |selector, declarations, specificity|
        declarations.scan(/([\.\w:]+)?(#{property})/) do |prop,val|
          values_hash[:counts][val.to_sym] += 1
          values_hash[:total] += 1
        end
      end
      return values_hash
    end

  end
end
