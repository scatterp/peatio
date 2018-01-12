class WithdrawChannel < ActiveYamlBase
  set_root_path "config"
  set_filename "withdraw_channels"

  include Channelable
  include HashCurrencible
  include International

  def blacklist
    self[:blacklist]
  end

  def as_json(options = {})
    super(options)['attributes'].merge({resource_name: key.pluralize})
  end
end
