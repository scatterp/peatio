module Admin
  module Withdraws
    class BlackcoinsController < ::Admin::Withdraws::BaseController
      load_and_authorize_resource :class => '::Withdraws::Blackcoin'

      def index
        start_at = DateTime.now.ago(60 * 60 * 24)
        @one_blackcoins = @blackcoins.with_aasm_state(:accepted).order("id DESC")
        @all_blackcoins = @blackcoins.without_aasm_state(:accepted).where('created_at > ?', start_at).order("id DESC")
      end

      def show
      end

      def update
        @blackcoin.process!
        redirect_to :back, notice: t('.notice')
      end

      def destroy
        @blackcoin.reject!
        redirect_to :back, notice: t('.notice')
      end
    end
  end
end
