defmodule Val do
  
  def read() do
    file = "input-6.txt"
    {:ok, body} = File.read(file)
    body |> part_one |> IO.puts
    body |> part_two |> IO.puts
  end
  
  def part_two(input) do
    input
      |> String.split("\n\n")
      |> Enum.map(fn x -> x
        |> String.split("\n")
        |> Enum.map(fn y -> y |> String.codepoints |> MapSet.new end)
        |> Enum.reduce(fn z, acc -> MapSet.intersection(z,acc) end)
        |> MapSet.to_list
        |> Enum.count
      end)
      |> Enum.sum
  end

  def part_one(input) do
    input
      |> String.split("\n\n")
      |> Enum.map(fn x -> x
        |> String.replace("\n", "")
        |> String.codepoints
        |> Enum.uniq
        |> Enum.count end)
      |> Enum.sum
  end
end
