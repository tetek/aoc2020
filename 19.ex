defmodule Val do
  def read() do
    file = "input-19.txt"
    {:ok, body} = File.read(file)
    body
      |> String.split("\n\n")
      |> List.first
      |> String.split("\n")
      |> Enum.map(fn x -> 
        [key | tail] = x
        |> String.split(":") 
        a = List.first(tail)
        ors = if a != nil do String.split(a, "|") else tail end
        if Enum.count(ors) > 1 do
          first = List.first(ors) |> String.split(" ")
          second = Enum.at(ors,1) |> String.split(" ")          
          %{"key": key, "rule": first, "or": second}
        else
          %{"key": key, "rule": ors}
        end
        
      
      end)
      # |> IO.inspect
      # |> Enum.map(&String.codepoints/1)
      # |> traverse
  end
  
end
