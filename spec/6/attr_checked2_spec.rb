require_relative('../../6/attr_checked2.rb')


class Person
  include(CheckedAttributes)

  attr_checked(:age) do |value|
    value > 10
  end
end

describe('attr_checked') do
  let(:person) { Person.new }

  it('有効な値をインスタンス変数に読み書きできる') do
    person.age = 20
    expect(person.age).to eq(20)
  end

  it('無効な値をセットしようとすると、エラーが発生する') do
    expect { person.age = 1 }.to raise_error(ValidationError)
  end
end