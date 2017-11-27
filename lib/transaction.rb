require_relative 'account.rb'
require_relative 'bank_accounts.rb'

class Transaction
  TYPE = ["DEPOSIT", "WITHDRAWAL", "BALANCE_CHECK"]

  attr_reader :date, :balance, :user_account, :type

  def initialize(user_id, pin_code, bank)
    @user_account = user_authentication(user_id, pin_code, bank)
    if @user_account
      @date = Time.now
      @type = nil
      @amount = nil
      @balance = @user_account.current_balance 
    else
      throw Error("User does not exist")
    end
  end

  def user_authentication(user_id, pin_code, bank)
    bank.find_account(user_id, pin_code) 
  end

  def deposit(amount)
    @balance = user_account.confirm_deposit(amount)
    if @balance
      @type = TYPE[0];
      @amount = amount;
      user_account.addTransaction(self);
      return true
    end
    throw Error("Deposit was not Succesfull")
  end

  def withdraw(amount)
    @balance = user_account.confirm_withdrawal(amount)
    if @balance
      @type = TYPE[1]
      @amount = amount
      user_account.addTransaction(self);
      return true
    end
    throw Error("Withdrawal was not Succesfull")
  end

  def balance_check
    @type = TYPE[2]
    @balance = user_account.current_balance
    user_account.addTransaction(self);
    return balance
  end
end
