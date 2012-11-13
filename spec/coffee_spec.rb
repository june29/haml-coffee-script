require File.expand_path('../spec_helper', __FILE__)
require 'haml/filters/coffee'

describe Haml::Filters::Coffee do
  it "should convert to JavaScript code" do
    haml = <<HAML
%h1
  hi
:coffee
  alert 1
HAML

    expected = <<EXPECTED
<h1>
  hi
</h1>
<script>
//<![CDATA[
(function() {

  alert(1);

}).call(this);

//]]>
</script>
EXPECTED

    Haml::Engine.new(haml).render.should == expected
  end
end
