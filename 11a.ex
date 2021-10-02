defmodule Val do
  def read() do
    file = "input-11.txt"
    {:ok, body} = File.read(file)
    # m = body
    #   |> String.split("\n")
    # |> IO.inspect
    #
    # count = Enum.at(m, 0)|> String.length
    #
    # a = Enum.map(m, &String.codepoints/1)
    # IO.inspect(a)

    lobby = body |> String.codepoints()
    # IO.inspect(Enum.count(lobby))
    c_max = lobby |> Enum.find_index(fn a -> a == "\n" end)
    lobby = lobby |> Enum.reject(fn a -> a == "\n" end)
    c_max = c_max - 1
    IO.inspect(c_max)
    lobby
    # IO.inspect(Enum.count(lobby))
  end

  def round(matrix, last) do
    new = matrix
    |> Enum.with_index
    |> Enum.map(fn {lobby,i} -> yep(matrix, i) end)


    count = new |> Enum.count(fn a -> a == "#" end)

    if count == last do count else round(new, count) end
  end

  def yep(m, i) do
    m
      |> adjacent(i)
      |> Enum.count(fn a ->  a == "#" end)
      |> decide(at(m, i))
  end

  def decide(count, "L") when count == 0 do "#" end
  def decide(count, "#") when count >= 4 do "L" end
  def decide(_, l) do l end

  def adjacent(m, i) do
    # c = rem(i, 96)
    # r = Float.floor(i / 96)
    [
      at(m, i - 97), at(m, i-96), at(m, i-95),
      at(m,i-1), at(m,i+1),
      at(m,i+95), at(m,i+96), at(m,i+97)
    ]
  end

  def at(m,i) when i > 0 do
    Enum.at(m,i)
    # c_max = 96
    #
    # Enum.at(m,r*c_max + c)
    #
    # case m |> Enum.at(r) do
    #   nil -> nil
    #   row -> case row |> Enum.at(c) do
    #     nil -> nil
    #     sth -> sth
    #   end
    # end
  end
  def at(m,i) do nil end


end
