class Transaction

  attr_reader :user_id, :pin_code, :date
  def initialize(user_id, pin_code)
    @user_id = user_id
    @pin_code = pin_code
    @date = Time.now
    @succeded = nil
  end
end
