class Account
  def initialize(user_id, user_pin)
    @transactions = []
    @user_id = user_id
    @user_pin = user_pin
    @current_balance = 0
  end

  def confirm_deposit(amount)
    if !amount.nil? && (amount.is_a? Numeric) && amount > 0
      @current_balance += amount
      return true
    end
    false
  end

end