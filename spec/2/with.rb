require_relative('../../3/with.rb')

describe('with') do
  class Resource
    def initialize
      @disposed = false
    end

    def dispose
      @disposed = true
    end

    def disposed?
      @disposed
    end
  end

  let(:resource) { Resource.new }
  using(KernelWith)

  it('エラーが起きない時、disposeが呼び出される') do
    with(resource) { resource.disposed? }
    expect(resource.disposed?).to eq(true)
  end

  it('エラーが起きても、disposeが呼び出される') do
    expect {
      with(resource) { raise(Exception) }
    }.to raise_error(Exception)
    expect(resource.disposed?).to eq(true)
  end
end