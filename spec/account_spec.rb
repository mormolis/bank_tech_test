require_relative "../lib/account.rb"
describe "Account" do
  
  account = Account.new("user", "pin")
  
  describe "#confim_deposit" do
    it "should take positive integer and return true" do
      expect(account.confirm_deposit(5)).to be_kind_of(Fixnum)
    end

    it "should take positive float and return true" do
      expect(account.confirm_deposit(5.00)).to be_kind_of(Float)
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
      expect(account.confirm_withdrawal(5)).to be_kind_of(Float)
    end
    
    it "should return true if the amount is equal to the current ballance" do
      expect(account.confirm_withdrawal(5.0)).to be_kind_of(Float)
    end

  end

  describe "#addTransaction" do
    let(:a_transaction) { double(:a_transaction, :date => "date") }
    
    it "adds a transaction to the transactions array" do
      expect {account.addTransaction(a_transaction)}.to change {account.transactions.count}.from(0).to(1)
    end
  end

  describe "#verify_account" do
    it "should return true if username and password match" do
      expect(account.verify_account("user","pin")).to eq(true)
    end
    it "should return false if username matches but password doesnt" do
      expect(account.verify_account("user","pin1")).to eq(false)
    end
    it "should return false if username doesn't match but password does" do
      expect(account.verify_account("user1","pin")).to eq(false)
    end
    it "should return false if username and password does not match" do
      expect(account.verify_account("user1","pin1")).to eq(false)
    end
  end

  describe "print_transactions" do
    account2 = Account.new("user2", "pin2")
    let(:transaction) { double(:transaction, :date => "date") }
    
    it "should print all the transactions" do
      expect(account2.print_transactions).to eq("Date || Credit || Debit || Balance\n")
    end
  end

  

  


end