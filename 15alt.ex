defmodule Val do
  @input  [14,3,1,0,9,5]
  @size   Enum.count(@input)
    
  def find(no) do    
    map = @input |> Enum.with_index |> Enum.into(%{})
    
    find_next(List.last(@input), @size - 1, no - @size, map, nil)
  end
    
  def find_next(last, i_size, rounds, map, l) when rounds > 0 do          
      new =
        case Map.get(map, last) do
          nil -> 0
          i -> i_size - i
        end        
      n_m = Map.put(map, l, i_size)
      find_next(new, i_size + 1, rounds - 1, n_m, new)
  end  
  def find_next(input,_,_,_,_) do input end    
end