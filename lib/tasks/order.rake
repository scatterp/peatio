namespace :order do
  task :mock => :environment do
    m = Member.find_by_email 'foo@peatio.dev'
    raise ArgumentError.new("Member not found") unless m
    # market = Market.find 'etheur'
    # market = Market.find 'btceur'
    # market = Market.find 'bcceur'
    # market = Market.find 'etceur'
    # market = Market.find 'zeceur'
    # market = Market.find 'ltceur'
    market = Market.find 'btseur'

    low = 2150
    high = 2250
    mid = 2200
    (low..high).each do |price|
      klass = (price < mid) ?  OrderBid : OrderAsk
      if klass.is_a?(OrderBid)
        print '.'.green
      else
        print '.'.yellow
      end
      volume = rand

      acct = nil
      if price > mid
        acct = m.get_account(market.quote_unit)
      else
        acct = m.get_account(market.base_unit)
      end

      bid_price = BigDecimal(Random.new.rand.to_s).round(3) + price

      order = klass.new(
        source:        'APIv2',
        state:         ::Order::WAIT,
        member_id:     m.id,
        ask:           market.base_unit,
        bid:           market.quote_unit,
        currency:      market.id,
        ord_type:      :limit,
        price:         bid_price,
        volume:        volume,
        origin_volume: volume
      )
      acct.plus_funds(order.compute_locked * 1.5)

      Ordering.new(order).submit
    end
  end
end
