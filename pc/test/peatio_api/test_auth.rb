require 'helper'

class TestAuth < Minitest::Test

  def test_signed_params
    auth = PeatioAPI::Auth.new('accesskey', 'secretkey')
    assert_equal({:tonce=>1234567, :access_key=>"accesskey", :signature=>"1b89e3a984c25eacb7439ae644be253b55975e35529ee665966e3b9d8e3dcb2f"}, auth.signed_params('GET', '/api/v2/orders', tonce: 1234567))
  end

end
