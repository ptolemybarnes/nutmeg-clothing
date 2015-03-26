require './app/lib/voucher'

describe Voucher do

  it 'extracts its information into a hash' do
    voucher = Voucher.new(reduction: 500, description: "£5 discount!")

    expect(voucher.extract).to eq({ description: "£5 discount!", reduction: 500})
  end

  it 'is no longer available after being redeemed' do
    voucher = Voucher.new(reduction: 500, description: "£5 discount!")

    voucher.redeem!

    expect(voucher.available?).to eq false
  end
end
