require_relative '../models/payment_method.rb'

class PaymentMethodsController

    attr_accessor :active_customer
    # sets @payment_method variable as a new instance of PaymentMethod
    def initialize(active_customer)
        @active_customer = active_customer
        @payment_method = PaymentMethod.new
    end

    def get_all_payment_methods
        all_payment_methods = @payment_method.list_all_payment_methods
        count = 1
        all_payment_methods.each do |payment_method|
            puts "#{count}. #{payment_method[0]} - #{payment_method[1]}: #{payment_method[2]}"
            count += 1
        end
        puts ""
        return all_payment_methods
    end

    def add_payment_method
        active_customer_id = @active_customer[0]
        puts active_customer_id
        puts "Name of Payment Method?"
        @payment_type = gets.chomp
        puts "Account Number?"
        @account_number = gets.chomp
        added_method = @payment_method.add_payment_method(active_customer_id, @payment_type, @account_number)
        print "Added '#{added_method[0][2]}' Account#: #{added_method[0][3]} for Customer ID: #{added_method[0][1]}"
    end

end

# pmc = PaymentMethodsController.new(1)
# pmc.add_payment_method
