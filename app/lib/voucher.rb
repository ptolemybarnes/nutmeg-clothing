
class Voucher 
  attr_reader :description, :reduction, :id
  
  def initialize options = {}
    @description = options[:description]
    @reduction   = options[:reduction]
    @id          = options[:id]
  end

  def extract
    { description: description, reduction: reduction }
  end

end

