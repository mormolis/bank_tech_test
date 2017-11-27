require 'account'
class Transaction
  TYPE = ["DEPOSIT", "WITHDRAWAL", "BALANCE_CHECK"]

  attr_reader :user_id, :pin_code, :date
  def initialize(user_id, pin_code)
    @user_acount = user_authentication(user_id, pin_code)
    if @user_acount
      @date = Time.now
      @type = nil
      @amount = nil
    else
      throw Error("User does not exist")
    end
  end

  def user_authentication(user_id, pin_code)
    # implement when account class will exist 
    @account = Account.new("test", "test")
     
  end

  def deposit(amount)
    if @account.confirm_deposit(money)
      @type = TYPE[0];
      @amount = money;
      @account.addTransaction(self);
      return true
    end
    throw Error("Deposit was not Succesfull")
  end



end
