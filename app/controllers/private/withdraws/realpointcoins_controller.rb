module Private::Withdraws
  class RealpointcoinsController < ::Private::Withdraws::BaseController
    include ::Withdraws::Withdrawable
  end
end
