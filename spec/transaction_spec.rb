require_relative '../lib/transaction.rb'
describe "Transaction" do
  transaction = Transaction.new("george321", "12345")
  describe "#initialize" do
    it "should take a user_id and a pin_code" do
      expect(transaction.user_id).to eq("george321") 
      expect(transaction.pin_code).to eq("12345") 
    end

    it "should create a time instance showing the date and time of the transaction" do
      expect(transaction.date).to be_an_instance_of(Time)
    end

    it "should perform user authentication before initializing a transaction" do
      expect{Transaction.new("someone", "a pincode")}.not_to raise_error
    end

  end

  describe "#user_authentication" do
    it "#user_authentication should return true if user_id and pin_code matches a user in the 'database'" do
      expect(transaction.user_authentication("someone", "a pincode")).to equal(true)
    end
    # more tests to be writen
  end

  describe "#deposit_money" do
    it "should comminicate with an acount "

  end



end
