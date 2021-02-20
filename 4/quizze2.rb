module FixnumRefinements
  refine(Integer) do
    alias_method(:old_plus, :+)

    def +(num)
      old_plus(num).old_plus(num)
    end
  end
end

using(FixnumRefinements)
puts(1 + 1)