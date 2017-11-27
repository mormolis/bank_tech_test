require_relative "../lib/account.rb"
require_relative "../lib/bank_accounts.rb"
require_relative "../lib/transaction.rb"


bank = BankAccounts.new
bank.create_a_new_account("george", "12345")
transaction = Transaction.new("george", "12345", bank)
puts "\n\n10 pounds deposit"
transaction.deposit(10)
transaction = Transaction.new("george", "12345", bank)
puts "balance check"
puts transaction.balance_check
transaction = Transaction.new("george", "12345", bank)
puts "\n\n3 pounds withdrawal"
transaction.withdraw(3)
transaction = Transaction.new("george", "12345", bank)
puts "balance check"
puts transaction.balance_check

account = bank.find_account("george", "12345")
puts account.print_transactions

