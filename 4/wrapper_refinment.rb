module StringRefinements
  refine(String) do
    def length
      super > 5 ? 'long' : 'short'
    end
  end
end