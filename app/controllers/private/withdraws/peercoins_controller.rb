module Private::Withdraws
  class PeercoinsController < ::Private::Withdraws::BaseController
    include ::Withdraws::Withdrawable
  end
end
