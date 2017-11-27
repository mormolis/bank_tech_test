require_relative '../lib/bank_accounts.rb'
describe "BankAccounts" do
  bank = BankAccounts.new
  describe "#create_a_new_account" do
    it "should return true if a new account is created" do
      expect(bank.create_a_new_account("user", "pass")).to eq(true)
    end
    it "should return true if username does not exist but pass is the same with a previews users one" do
      expect(bank.create_a_new_account("user1", "pass")).to eq(true)
    end

    it "should return false if an account exists with the same credentials" do
      expect(bank.create_a_new_account("user", "pass")).to eq(false)
    end

    it "should return false if an account username and pin are not strings" do
      expect(bank.create_a_new_account(Object.new, "pass1")).to eq(false)
      expect(bank.create_a_new_account("user2", Object.new)).to eq(false)
      expect(bank.create_a_new_account(Object.new, Object.new)).to eq(false)
    end
  end

  describe "#find_account" do
    it "should return a type of Account if the account is on the list" do
      expect(bank.find_account("user1", "pass")).to be_an_instance_of(Account)
    end

    it "should return nil if the account is not on the list" do
      expect(bank.find_account("user11", "pass")).to be_nil
    end
  end
end
