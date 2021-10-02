defmodule Val do
  @input  [14,3,1,0,9,5]
  @size   Enum.count(@input)
    
  def find(no) do
    @input
    |> Enum.reverse
    |> find_next(no - @size, @size)
  end
  
  def elo() do
    1..2020 |> Enum.reduce(fn i -> find_next(@input)end)
  end
  def find_next(input, rounds, size) when rounds > 0 do      
      [last | tail] = input      
      new =
        case tail |> Enum.find_index(fn x-> x == last end) do
          nil -> 0
          i -> i + 1
        end
      
      find_next([new | input], rounds - 1, size)
  end  
  def find_next(input,_,_) do input |> List.first end    
end