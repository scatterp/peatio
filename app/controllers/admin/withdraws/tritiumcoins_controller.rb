module Admin
  module Withdraws
    class TritiumcoinsController < ::Admin::Withdraws::BaseController
      load_and_authorize_resource :class => '::Withdraws::Tritiumcoin'

      def index
        start_at = DateTime.now.ago(60 * 60 * 24)
        @one_tritiumcoins = @tritiumcoins.with_aasm_state(:accepted).order("id DESC")
        @all_tritiumcoins = @tritiumcoins.without_aasm_state(:accepted).where('created_at > ?', start_at).order("id DESC")
      end

      def show
      end

      def update
        @tritiumcoin.process!
        redirect_to :back, notice: t('.notice')
      end

      def destroy
        @tritiumcoin.reject!
        redirect_to :back, notice: t('.notice')
      end
    end
  end
end
