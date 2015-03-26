class Voucher 
  attr_reader :description, :reduction, :id
  
  def initialize options = {}
    @description = options[:description]
    @reduction   = options[:reduction]
    @id          = options[:id]
    @available   = true
  end

  def extract
    { description: description, reduction: reduction, id: id }
  end

  def redeem!
    @available = false
  end

  def available?
    @available
  end

end

