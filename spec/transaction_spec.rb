require_relative '../lib/transaction.rb'
describe "Transaction" do
  transaction = Transaction.new("george321", "12345")
  describe "#initialize" do
    it "should create a time instance showing the date and time of the transaction" do
      expect(transaction.date).to be_an_instance_of(Time)
    end

    it "should perform user authentication before initializing a transaction" do
      expect{Transaction.new("someone", "a pincode")}.not_to raise_error
    end

  end

  describe "#user_authentication" do
    it "#user_authentication should return true if user_id and pin_code matches a user in the 'database'" do
      expect(transaction.user_authentication("someone", "a pincode")).to be_an_instance_of(Account)
    end
    # more tests to be writen
  end

  describe "#deposit" do
    it "should return true  given an mount of money" do
      expect(transaction.deposit(10)).to eq(true)
    end

    it "should throw an error  given a random object" do
      expect{transaction.deposit(Object.new)}.to raise_error
    end
  end

  describe "#withdraw" do
    it "should return true  given an mount of money that can be withdrawned" do
      expect(transaction.withdraw(1)).to eq(true)
    end

    it "should throw an error  given a random object" do
      expect{transaction.withdraw(Object.new)}.to raise_error
    end

    it "should throw an error  given an amount of money that cannot be withdrawned" do
      expect{transaction.withdraw(Object.new)}.to raise_error
    end


  end



end
