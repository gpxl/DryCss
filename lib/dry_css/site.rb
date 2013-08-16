require "nokogiri"

module DryCss
  include Nokogiri
  class Site
    def initialize(uri)
      @html = Nokogiri::HTML(open(uri))
    end

    def uris
      @uris ||= find_uris
    end

    private

    def find_uris
      @uris = []
      @html.css('link[rel="stylesheet"]').each{|link| @uris << link[:href]}
      return @uris
    end

  end
end
