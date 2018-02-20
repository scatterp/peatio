module Admin
  module Withdraws
    class PeercoinsController < ::Admin::Withdraws::BaseController
      load_and_authorize_resource :class => '::Withdraws::Peercoin'

      def index
        start_at = DateTime.now.ago(60 * 60 * 24)
        @one_peercoins = @peercoins.with_aasm_state(:accepted).order("id DESC")
        @all_peercoins = @peercoins.without_aasm_state(:accepted).where('created_at > ?', start_at).order("id DESC")
      end

      def show
      end

      def update
        @peercoin.process!
        redirect_to :back, notice: t('.notice')
      end

      def destroy
        @peercoin.reject!
        redirect_to :back, notice: t('.notice')
      end
    end
  end
end
