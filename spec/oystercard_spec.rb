load "oystercard.rb"

describe Oystercard do
	it "shows the balance" do
  expect(subject.balance).to eq 0
	end

  it "tops up the balance" do
    expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
  end

  it 'cannot top up above the balance limit' do
    balance_limit = Oystercard::BALANCE_LIMIT
    subject.top_up(balance_limit)
    expect { subject.top_up 1}.to raise_error "Your balance cannot exceed #{balance_limit}"
  end

end