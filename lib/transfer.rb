class Transfer
  attr_accessor :sender, :receiver, :status, :amount, :counter
  # your code here
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
    @counter = 0
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if valid? == false
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif valid? == true && counter < 1
      @counter = @counter += 1
      @sender.deposit(-@amount)
      @receiver.deposit(@amount)
      @status = "complete"
    end
  end



  def reverse_transfer
  end

end
