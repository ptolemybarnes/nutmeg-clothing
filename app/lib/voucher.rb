
class Voucher 
  attr_reader :description, :reduction
  
  def initialize options = {}
    @description = options[:description]
    @reduction   = options[:reduction]
  end

  def extract
    { description: description, reduction: reduction }
  end

end

