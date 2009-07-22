require 'test_helper'

class AhaTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Aha.new.valid?
  end
end
