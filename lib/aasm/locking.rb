module AASM::Locking
  def aasm_write_state(new_state, name = :defalt)
    self.lock!
    super
  end
end
