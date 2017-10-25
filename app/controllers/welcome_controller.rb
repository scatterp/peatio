class WelcomeController < ApplicationController
  layout 'landing'

  def index
    @show_index_menu = true;
    @tickers = Market.all
  end
end
