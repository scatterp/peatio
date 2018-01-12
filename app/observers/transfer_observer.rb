class TransferObserver < AuditObserver
  observe :deposit, :withdraw

  def after_update(record)
    if record.saved_change_to_attribute.aasm_state?
      Audit::TransferAuditLog.audit!(record, current_user)
    end
  end

end
