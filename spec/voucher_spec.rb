require './app/lib/voucher'

describe Voucher do

  it 'extracts its information into a hash' do
    voucher = Voucher.new(reduction: 500, description: "£5 discount!", id: 1)

    expect(voucher.extract).to eq(
      { description: "£5 discount!", reduction: 500, id: 1, 
        :available? => true })
  end

  context 'on being redeemed' do

    it 'is no longer available' do
      voucher = Voucher.new(reduction: 500, description: "£5 discount!")

      voucher.redeem!(10)

      expect(voucher.available?).to eq false
    end

    it "raises an error if the total does not satisfy its applicability" do
      voucher = Voucher.new(reduction: 100) do |total|
        total < 1000
      end

      expect(lambda { voucher.redeem!(2000) }).to raise_error(
        'The voucher is not applicable to your shopping cart')
    end
  end
end

