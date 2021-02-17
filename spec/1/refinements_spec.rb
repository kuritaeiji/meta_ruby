require_relative('../../1/refinements.rb')

describe('StringExtensions') do
  describe('usingメソッドを使用した時') do
    using(StringExtensions)
    it('to_alphanumaricかつかえる') do
      expect('my .string#'.to_alphanumaric).to eq('my string')
    end
  end

  it('to_alphanumaricはusingなしに使えない') do
    expect { 'my string#'.to_alphanumaric }.to raise_error(NoMethodError)
  end
end