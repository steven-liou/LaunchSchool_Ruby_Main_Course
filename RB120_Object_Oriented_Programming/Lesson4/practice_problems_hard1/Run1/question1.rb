class SecretFile
  attr_reader :log
  def initialize(secret_data, log)
    @log = log
    @data = secret_data
  end

  def data
    log.create_log_entry
    @data
  end

end

class SecurityLogger
  def create_log_entry
  end
end