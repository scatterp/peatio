RSpec::Matchers.define :be_d do |expected|
  match do |actual|
    case expected
    when BigDecimal, String
      actual.to_d == expected.to_d
    else
      raise "not support type #{expected.class}"
    end
  end

  failure_message_for_should do |actual|
    "expected #{actual.to_s} would be of #{expected.to_s}"
  end
end
