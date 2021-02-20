require_relative('../../4/loan.rb')

class TestTime
  def self.now
    'Mon Apr 12 11:33:33'
  end
end

describe('Loan') do
  describe('to_s') do
    it('loanを文字列に変換した値を返す') do
      Loan.instance_eval { @time_class = TestTime }
      loan = Loan.new('book')
      expect(loan.to_s).to eq("BOOK loaned on Mon Apr 12 11:33:33")
    end
  end
end