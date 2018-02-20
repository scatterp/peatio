module Private
  module Deposits
    class DolarsController < ::Private::Deposits::BaseController
      include ::Deposits::CtrlBankable
    end
  end
end
