# == Schema Information
#
# Table name: fund_sources
#
#  id         :integer          not null, primary key
#  extra      :string
#  uid        :string
#  is_locked  :boolean          default(FALSE)
#  created_at :datetime
#  updated_at :datetime
#  deleted_at :datetime
#  member_id  :integer
#  currency   :integer
#

class FundSource < ApplicationRecord
  include Currencible

  attr_accessor :name

  paranoid

  belongs_to :member

  validates_presence_of :uid, :extra, :member

  def label
    if currency_obj.try :coin?
      "#{uid} (#{extra})"
    else
      [I18n.t("banks.#{extra}"), "****#{uid[-4..-1]}"].join('#')
    end
  end

  def as_json(options = {})
    super(options).merge({label: label})
  end
end
