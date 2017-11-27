class BankAccounts

  def initialize
    @bank_acounts = []
  end

  # I use only username and pin for the shake of simplicity
  def create_a_new_account(user_id, user_pin)
    if acceptable_credentials?(user_id, user_pin)
      @bank_acounts << Account.new(user_id, user_pin)
      return true
    end
    false
  end

  def find_account(user_id, user_pin)
    @bank_acounts.detect { |account| account.verify_account(user_id, user_pin) } 
  end

  private
  def acceptable_credentials?(user_id, user_pin)
    user_id.is_a?(String) && user_pin.is_a?(String) && find_account(user_id, user_pin).nil?
  end

end
