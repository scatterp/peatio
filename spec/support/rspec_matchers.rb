RSpec::Matchers.define :be_d do |expected|
  match do |actual|
    if expected.respond_to?(:to_d)
      actual.to_d == expected.to_d
    else
      raise "not support type #{expected.class}"
    end
  end

  failure_message do |actual|
    "expected #{actual.to_d.to_s} to be #{expected.to_d.to_s}".yellow
  end
end
