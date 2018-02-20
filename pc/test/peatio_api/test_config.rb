require 'helper'

class TestConfig < Minitest::Test

  def test_get_peatiorc
    path = File.expand_path '../../fixtures/peatiorc', __FILE__
    access_key, secret_key = PeatioAPI::Config.get_peatiorc(path)
    assert_equal 'access1234567', access_key
    assert_equal 'secret1234567', secret_key
  end

end
