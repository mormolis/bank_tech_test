class Transaction

  attr_reader :user_id, :pin_code, :date
  def initialize(user_id, pin_code)
    @user_acount = user_authentication(user_id, pin_code)
    if @user_acount
      @user_id = user_id
      @pin_code = pin_code
      @date = Time.now
      @succeded = nil
    else
      throw Error("User does not exist")
    end
  end

  def user_authentication(user_id, pin_code)
    
    # implement when account class will exist 
    return true
  end


end
