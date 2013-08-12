require 'spec_helper'

describe DryCss do
  it 'should return a list of colors found in css' do
    css = DryCss.new('http://www.example.com/example.css')
    css.colors.should eq [['#fff',1],['#000',2]]
  end
end

