class Voucher 
  attr_reader :description, :reduction, :id
  
  def initialize description: '', reduction:, id: 1, &block
    @description = description 
    @reduction   = reduction
    @id          = id 
    @available   = true
    @redeemability_criteria = block
  end

  def extract
    { description: description, reduction: reduction, id: id,
    :available? => available? }
  end

  def redeem!(total=nil, items=[])
    check_redeemability(total, items) if @redeemability_criteria
    @available = false
  end

  def available?
    @available
  end

  private

  def check_redeemability(total, items)
    unless redeemable?(total, items)
      fail 'The voucher is not applicable to your shopping cart'
    end
  end

  def redeemable? total, items
    @redeemability_criteria.call(total, items)
  end

end

