require File.expand_path('../../spec_helper.rb', __FILE__)

describe DryCss::CSS do
  before(:all) do
    file_name = 'file://' + File.expand_path(File.dirname(__FILE__)) + '/../fixtures/example.css'
    @css = DryCss::CSS.new(file_name)
  end

  it 'returns a CSSParser object' do
    @css.parser.should be_a(DryCss::Parser)
  end

  it 'returns array of color values' do
    @css.colors.should eq({:counts => {:"#fff;"=>1, :"#000;"=>2}, :total => 3})
  end

  it 'handles multiple uris' do
    file_name = 'file://' + File.expand_path(File.dirname(__FILE__)) + '/../fixtures/example.css'
    file_name2 = 'file://' + File.expand_path(File.dirname(__FILE__)) + '/../fixtures/example2.css'
    @css = DryCss::CSS.new(file_name, file_name2)
    @css.colors.should eq({:counts => {:"#fff;"=>2, :"#000;"=>4}, :total => 6})
  end

  it 'ignores bad uris' do
    file_name = 'file://' + File.expand_path(File.dirname(__FILE__)) + '/../fixtures/example.css'
    file_name2 = 'file://' + File.expand_path(File.dirname(__FILE__)) + '/../fixtures/example404.css'
    @css = DryCss::CSS.new(file_name, file_name2)
    @css.colors.should eq({:counts => {:"#fff;"=>1, :"#000;"=>2}, :total => 3})
  end

end
