require "nokogiri"

module DryCss
  include Nokogiri
  class Site
    def initialize(uri)
      @uri = uri
      @html = Nokogiri::HTML(open(uri))
    end

    def uris
      @uris ||= find_uris
    end

    private

    def find_uris
      @uris = []
      @html.css('link[rel="stylesheet"]').each{|link| @uris << ensure_full_uri(link[:href])}
      return @uris
    end

    def ensure_full_uri(path)
      path[0] == '/' ? @uri + path : path
    end

  end
end
