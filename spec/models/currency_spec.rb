# == Schema Information
#
# Table name: currencies
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  code        :string           not null
#  symbol      :string           default("฿"), not null
#  is_tradable :boolean          default(FALSE)
#  fiat        :boolean          default(FALSE)
#  data        :jsonb
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_currencies_on_code  (code) UNIQUE
#

RSpec.describe Currency, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
