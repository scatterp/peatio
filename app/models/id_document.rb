# == Schema Information
#
# Table name: id_documents
#
#  id                 :integer          not null, primary key
#  id_document_type   :integer
#  name               :string
#  id_document_number :string
#  member_id          :integer
#  created_at         :datetime
#  updated_at         :datetime
#  birth_date         :date
#  address            :text
#  city               :string
#  country            :string
#  zipcode            :string
#  id_bill_type       :integer
#  aasm_state         :string
#

class IdDocument < ApplicationRecord
  extend Enumerize
  include AASM
  include AASM::Locking

  has_one :id_document_file, class_name: Asset::IdDocumentFile.name, as: :attachable
  accepts_nested_attributes_for :id_document_file

  has_one :id_bill_file, class_name: Asset::IdBillFile.name, as: :attachable
  accepts_nested_attributes_for :id_bill_file

  belongs_to :member

  validates_presence_of :name, :id_document_type, :id_document_number, :id_bill_type, allow_nil: true
  validates_uniqueness_of :member

  enumerize :id_document_type, in: {id_card: 0, passport: 1, driver_license: 2}
  enumerize :id_bill_type,     in: {bank_statement: 0, tax_bill: 1}

  alias_attribute :full_name, :name

  aasm do
    #state :unverified, initial: true
    state :unverified
    state :verifying
    state :verified, initial: true

    event :submit do
      transitions from: :unverified, to: :verifying
    end

    event :approve do
      transitions from: [:unverified, :verifying],  to: :verified
    end

    event :reject do
      transitions from: [:verifying, :verified],  to: :unverified
    end
  end
end
