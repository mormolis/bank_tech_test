require_relative "../lib/account.rb"
describe "Account" do
  account = Account.new("user", "pin")
  describe "#confim_deposit" do
    it "should take positive integer and return true" do
      expect(account.confirm_deposit(5)).to eq(true)
    end

    it "should take positive float and return true" do
      expect(account.confirm_deposit(5.00)).to eq(true)
    end

    it "should return false on zero and negative amounts" do\
      expect(account.confirm_deposit(-1)).to eq(false)
      expect(account.confirm_deposit(0)).to eq(false)
    end

    it "should return false on object rather than numeric values" do\
      expect(account.confirm_deposit(Object.new)).to eq(false)
    end
  end

  describe "#confirm_withdrawal " do

    it "should return false if the amount is greater than the current ballance" do
      expect(account.confirm_withdrawal(100)).to eq(false)
    end
    it "should return true if the amount is less than the current ballance" do

      expect(account.confirm_withdrawal(5)).to eq(true)
    end
    it "should return true if the amount is equal to the current ballance" do

      expect(account.confirm_withdrawal(5.0)).to eq(true)
    end

  end


end