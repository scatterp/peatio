# == Schema Information
#
# Table name: audit_logs
#
#  id             :integer          not null, primary key
#  type           :string
#  operator_id    :integer
#  created_at     :datetime
#  updated_at     :datetime
#  auditable_id   :integer
#  auditable_type :string
#  source_state   :string
#  target_state   :string
#
# Indexes
#
#  index_audit_logs_on_auditable_id_and_auditable_type  (auditable_id,auditable_type)
#  index_audit_logs_on_operator_id                      (operator_id)
#

module Audit
  class AuditLog < ApplicationRecord
    belongs_to :operator, class_name: Member.name, foreign_key: 'operator_id'
    belongs_to :auditable, polymorphic: true
  end
end
