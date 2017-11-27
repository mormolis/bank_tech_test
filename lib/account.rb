class Account
  attr_reader :current_balance, :transactions
  def initialize(user_id, user_pin)
    @transactions = []
    @user_id = user_id
    @user_pin = user_pin
    @current_balance = 0
  end

  def print_transactions
    str = "Date || Credit || Debit || Balance\n"
    transactions.each do |transaction|
      str += transaction.date.strftime("%Y-%m-%d") + "||"
      str += transaction.type == "DEPOSIT" ?  "||#{transaction.amount}||" : "||-||"
      str += transaction.type == "WITHDRAWAL" ? "||#{transaction.amount}||" : "||-||"
      str += "||" + transaction.balance.to_s 
      str += "\n"
    end
    return str
  end

  def verify_account(user_id, user_pin)
    @user_id == user_id && @user_pin == user_pin
  end

  def confirm_deposit(amount)
    if acceptable_deposit_amount(amount)
      @current_balance += amount
      return current_balance
    end
    false
  end

  def confirm_withdrawal(amount)
    if acceptable_withdrawal_amount(amount)
      @current_balance -= amount
      return current_balance
    end
    false
  end

  def addTransaction(transaction)
    @transactions << transaction
  end

  private
  def acceptable_deposit_amount(amount)
    !amount.nil? && (amount.is_a? Numeric) && amount > 0
  end

  def acceptable_withdrawal_amount(amount)
    acceptable_deposit_amount(amount) && ((current_balance - amount) >= 0)
  end

end