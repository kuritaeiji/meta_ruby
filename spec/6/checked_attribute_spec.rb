require_relative('../../6/add_checked_attr.rb')

class Person
end

describe('add_checked_attribute') do
  let(:person) { Person.new }
  before do
    add_checked_attr(Person, :age) do |value|
      value > 10
    end
  end

  it('@ageに値をセットできる') do
    person.age = 20
    expect(person.instance_variable_get(:@age)).to eq(20)
  end

  it('@ageの値を読み取れる') do
    person.age = 20
    expect(person.age).to eq(20)
  end

  it('ブロックがfalseを返す場合、@ageに値をセット出来ず、エラーが発生する') do
    expect { person.age = 1 }.to raise_error(ValidationError)
    expect(person.age).to eq(nil)
  end
end