module KernelWith
  refine(Kernel) do
    def with(resource)
      yield
    ensure
      resource.dispose
    end
  end
end