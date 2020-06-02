require './lib/wizard_intro'

describe '#get_min_magic' do
  it 'works for example' do
    w1 = 0
    w2 = 9
    refs = [123, 864, 783, 81, 6, 87, 94, 46, 1, 14]
    cost, path = get_min_magic(w1, w2, refs)
    expect(cost).to be 23
    expect(path).to eq [0, 1, 4, 6, 9]
  end
end
