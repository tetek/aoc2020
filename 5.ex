defmodule Val do
  def read() do
    file = "input-5.txt"
    {:ok, body} = File.read(file)
    body
      |> String.split("\n")
      |> Enum.map(&String.codepoints/1)
      |> Enum.map(&al/1)
      # |> Enum.max
      |> Enum.reduce(%{}, fn x, acc -> f(x, acc) end)
  end

  def f({r,c}, state) do
    IO.inspect {r,c, state}
    case state[r] do
      nil -> Map.merge(state, %{ r => [c]})
      cs -> %{state | r=> cs ++ [c]}
    end
  end

  def al(row) do
    b = [64,32, 16, 8, 4, 2, 1]
    blat = row
      |> Enum.take(7)
      |> Enum.with_index
      |> Enum.map(fn {a, i} -> if a == "B" do Enum.at(b,i) else 0 end end)
      # |> IO.inspect
      |> Enum.sum

    c = [4,2,1]

    column = row
    |> Enum.take(-3)
    |> Enum.with_index
    |> Enum.map(fn {a, i} -> if a == "R" do Enum.at(c,i) else 0 end end)
    # |> IO.inspect
    |> Enum.sum

    {blat, column}


  end

  def r(d) do
    d
    |> Enum.reject(fn a ->
      Enum.at(Map.values(a),0)
       |> Enum.count() |> (fn ee -> ee == 8 end ).() end)
  end
end
