require './app/lib/voucher'

describe Voucher do

  it 'extracts its information into a hash' do
    voucher = Voucher.new(reduction: 500, description: "£5 discount!")

    expect(voucher.extract).to eq({ description: "£5 discount!", reduction: 500})
  end
end
