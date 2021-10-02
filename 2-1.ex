defmodule Val do
  def read() do
    file = "input-2.txt"
    {:ok, body} = File.read(file)
    body
      |> String.split("\n")
      |> Enum.reduce(0, fn l, acc -> if(Val.re(l), do: acc + 1, else: acc) end)
  end

  def re(nil) do false end
  def re("") do false end
  def re(line) do
    IO.inspect(line)
    d = Regex.named_captures(~r/(?<min>\d+)-(?<max>\d+) (?<letter>.): (?<pass>[a-z]+)/, line)
    {min, ""} = Integer.parse(d["min"])
    {max, ""} = Integer.parse(d["max"])

    c = d["pass"]
      |> String.codepoints
      # |> Enum.reduce(0, fn c, acc -> if(c == d["letter"], do: acc + 1, else: acc) end)
      # |> (fn a -> a >= min && a <= max end).()
      # IO.inspect(min)
      # IO.inspect(Enum.at(c,min-1))
    Enum.at(c,min-1) == d["letter"] && Enum.at(c,max-1) != d["letter"] || Enum.at(c,min-1) != d["letter"] && Enum.at(c,max-1) == d["letter"]
  end

end
