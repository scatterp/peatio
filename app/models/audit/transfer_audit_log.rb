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
  class TransferAuditLog < AuditLog

    def self.audit!(transfer, operator = nil)
      old_state = transfer.aasm_state_before_last_save
      create(operator_id: operator.try(:id), auditable: transfer,
             source_state: old_state, target_state: transfer.aasm_state)
    end

  end
end
