require 'test/unit'
require 'salesforce'

class SalesforceTest < Test::Unit::TestCase
  def test_dummy
    assert_equal "dummy", Salesforce.new.dummy
  end

end
