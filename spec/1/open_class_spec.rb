require_relative('../../1/open_class.rb')

describe('String#to_alphanumaric') do
  it('アルファベットとスペース以外は空文字に置換する') do
    expect('!the alp@habet##'.to_alphanumaric).to eq('the alphabet')
  end
end

describe('Array#replace') do
  it('第一引数を第二引数で置換') do
    expect(['one', 'two', 'three'].replace('one', 'zero')).to eq(['zero', 'two', 'three'])
  end
end