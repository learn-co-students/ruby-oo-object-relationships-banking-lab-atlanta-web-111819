

class Transfer
  
  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver  = receiver
    @status = "pending"
    @amount = amount
    
  end

  def valid?
    if self.sender.status && self.receiver.status
      if self.sender.valid? && self.receiver.valid?
        return true
      end 
    end 
    return false
  end 


  def execute_transaction
    if self.amount < self.sender.balance
      if self.valid? == true
        if status == "pending"
          new_r_balance = self.receiver.balance + amount
          new_s_balance = self.sender.balance - amount
          self.sender.balance = new_s_balance
          self.receiver.balance = new_r_balance
          if new_r_balance == self.receiver.balance && new_s_balance == self.sender.balance
            self.status = "complete"
          end 
        end 
      else 
        self.status = "rejected"
        return "Transaction rejected. Please check your account balance."
      end 
    else 
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end 
  end 


  def reverse_transfer
    if status == "complete"
      self.sender.balance += amount
      self.receiver.balance -= amount
      self.status = "reversed"
    end 



  end 









end
