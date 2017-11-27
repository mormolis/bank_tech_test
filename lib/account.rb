class Account
  attr_reader :current_balance
  def initialize(user_id, user_pin)
    @transactions = []
    @user_id = user_id
    @user_pin = user_pin
    @current_balance = 0
  end

  def confirm_deposit(amount)
    if acceptable_deposit_amount(amount)
      @current_balance += amount
      return true
    end
    false
  end

  def confirm_withdrawal(amount)
    if acceptable_withdrawal_amount(amount)
      @current_balance -= amount
      return true
    end
    false
  end

  private
  def acceptable_deposit_amount(amount)
    !amount.nil? && (amount.is_a? Numeric) && amount > 0
  end

  def acceptable_withdrawal_amount(amount)
    acceptable_deposit_amount(amount) && ((current_balance - amount) >= 0)
  end

end