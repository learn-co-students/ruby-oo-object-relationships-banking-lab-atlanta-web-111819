require 'pry'

class Transfer
  # your code here
attr_accessor :sender, :receiver, :status, :amount
attr_reader 

  def initialize (sender, receiver, amount)
    @sender = sender 
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end 

  def valid?
    if @sender.valid? == true  && @receiver.valid? == true
      true
    else 
      false 
    end 
  end 
       
  def execute_transaction
      #make sure transfer is valid
      #make sure sender balance is greater than amount sending.
      #self transaction is still pending
      if @status == "pending"
        if self.valid?
          if @sender.balance > amount
            @sender.balance -= amount 
            @receiver.balance += amount
            @status = "complete"
          else 
            @status = "rejected"
            return "Transaction rejected. Please check your account balance."
          end
        else 
          @status = "rejected"
          return "Transaction rejected. Please check your account balance."
        end 
      end 
    end 

    def reverse_transfer
      if @status == "complete"
        @sender.balance += amount
        @receiver.balance -= amount
        @status = "reversed"
      end 
    end 


end
