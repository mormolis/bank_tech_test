require_relative '../lib/transaction.rb'
describe "Transaction" do
  describe "#initialize" do
    transaction = Transaction.new("george321", "12345")
    it "should take a user_id and a pin_code" do
      expect(transaction.user_id).to eq("george321") 
      expect(transaction.pin_code).to eq("12345") 
    end

    it "should create a time instance showing the date and time of the transaction" do
      expect(transaction.date).to be_an_instance_of(date)
    end




    it "#user_authentication should return true if user_id and pin_code matches a user in the database" do
      
    end
  end

  
end