require 'account'
class Transaction
  TYPE = ["DEPOSIT", "WITHDRAWAL", "BALANCE_CHECK"]

  attr_reader :date, :balance, :user_account
  def initialize(user_id, pin_code)
    @user_account = user_authentication(user_id, pin_code)
    if @user_account
      @date = Time.now
      @type = nil
      @amount = nil
      @balance = nil
    else
      throw Error("User does not exist")
    end
  end

  def user_authentication(user_id, pin_code)
    # implement when account class will exist 
     Account.new("test", "test")
     
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



end
