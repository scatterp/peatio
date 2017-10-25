module Private::Withdraws
  class BlackcoinsController < ::Private::Withdraws::BaseController
    include ::Withdraws::Withdrawable
  end
end
