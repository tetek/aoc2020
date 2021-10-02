defmodule Val do
  def read() do
    file = "input-3.txt"
    {:ok, body} = File.read(file)
    body
      |> String.split("\n")
      |> IO.inspect
      |> Enum.map(&String.codepoints/1)
      |> traverse
  end

  def traverse(matrix) do
    max_c = Enum.count(Enum.at(matrix,0))
    max_r = Enum.count(matrix)
    r = 0
    c = 0

    count(matrix, 0,0,0, 1, 1) *
    count(matrix, 0,0,0, 3, 1) *
    count(matrix, 0,0,0, 5, 1) *
    count(matrix, 0,0,0, 7, 1) *
    count(matrix, 0,0,0, 1, 2)

  end

  def count([], c,r,acc, sc, sr) do nil end
  def count(matrix, c, r, acc, sc, sr) do
    if (r >= Enum.count(matrix)-1) do
      acc
    else
      row  = Enum.at(matrix, r)
      val = Enum.at(row, rem(c, Enum.count(row)))
      acc = if val == "#", do: acc + 1, else: acc
      count(matrix, c + sc, r + sr, acc, sc, sr)
    end
  end

end
