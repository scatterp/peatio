module Private::Withdraws
  class TritiumcoinsController < ::Private::Withdraws::BaseController
    include ::Withdraws::Withdrawable
  end
end
