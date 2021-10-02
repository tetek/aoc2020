defmodule Val do
  def read() do
    file = "input-16.txt"
    {:ok, body} = File.read(file)
    all = body |> String.split("\n")
    rules = 
    all |> Enum.take(20) |> Enum.map(fn x -> 
      d = Regex.named_captures(~r/(?<key>\D+): (?<a_min>\d+)-(?<a_max>\d+) or (?<b_min>\d+)-(?<b_max>\d+)/, x)
      {a_min, ""} = Integer.parse(d["a_min"])
      {a_max, ""} = Integer.parse(d["a_max"])
      
      {b_min, ""} = Integer.parse(d["b_min"])
      {b_max, ""} = Integer.parse(d["b_max"])
      # %{d["key"] => {a_min..a_max, b_min..b_max}}
      [a_min..a_max, b_min..b_max]
    end) |> List.flatten
    
      
      IO.inspect(rules)
      nearby = all |> Enum.drop(25) |> Enum.map(fn x -> 
        x 
        |> String.split(",") 
        |> Enum.reduce([], fn y, acc -> 
          {val, ""} = Integer.parse(y)
          case  Enum.find(rules, fn r -> Enum.member?(r, val) end) do
            nil -> [val|acc]
            _ -> acc
          end
        end)
        |> List.flatten
        # |> Enum.sum
      end)
      # |> Enum.map(&String.codepoints/1)
      # |> Enum.map(&al/1)
      # # |> Enum.max
      # |> Enum.reduce(%{}, fn x, acc -> f(x, acc) end)
  end
end