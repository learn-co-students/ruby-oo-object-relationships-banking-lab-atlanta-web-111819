class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount, :balance
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
    @balance = balance
  end

  def valid?
    if @sender.valid? == true && @receiver.valid? == true
      true
    else
      false
    end
  end
  def execute_transaction
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
