defmodule Val do
  def read() do
    file = "input-11.txt"
    {:ok, body} = File.read(file)
    body
      |> String.split("\n")
      |> Enum.map(&String.codepoints/1)
  end

  def round(matrix, last) do
    new = matrix
    |> Enum.with_index
    |> Enum.map(fn {row,r} ->
                  row |> Enum.with_index
                    |> Enum.map(fn {_, c} -> yep(matrix, r, c) end)
                end)

    count = new |> List.flatten() |> Enum.count(fn a -> a == "#" end)

    if count == last do count else round(new, count) end
  end

  def yep(m, r, c) do
    m
      |> adjacent(r, c)
      |> Enum.count(fn a ->  a == "#" end)
      |> decide(at(m, r, c))
  end

  def decide(count, "L") when count == 0 do "#" end
  def decide(count, "#") when count >= 4 do "L" end
  def decide(_, l) do l end

  def adjacent(m, r,c) do
    [
      at(m, r-1, c-1), at(m, r-1,c), at(m, r-1, c+1),
      at(m,r,c-1), at(m,r,c+1),
      at(m,r+1,c-1), at(m,r+1,c), at(m,r+1,c+1)
    ]
  end

  def at(m,r,c) when r >= 0 and c >=0 do
    case m |> Enum.at(r) do
      nil -> nil
      row -> case row |> Enum.at(c) do
        nil -> nil
        sth -> sth
      end
    end
  end
  def at(m,r,c) do nil end


end
