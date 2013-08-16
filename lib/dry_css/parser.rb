require 'css_parser'
require "nokogiri"

module DryCss
  include CssParser
  class Parser < CssParser::Parser
  end
end

