defmodule Val do
  def read() do
    file = "input-4.txt"
    {:ok, body} = File.read(file)
    a = body
      |> String.split("\n\n")

    a |> Enum.count |> IO.inspect
    a
      |> IO.inspect
      # |> Enum.map(&validate/1)
      |> Enum.map(&v/1)
      |> Enum.count(fn x -> x == true end)
      |> IO.inspect
      # |> Enum.map(&String.codepoints/1)
      # |> traverse

  end
  def validate(string) do
    String.contains?(string, "byr:") &&
    String.contains?(string, "iyr:") &&
    String.contains?(string, "eyr:") &&
    String.contains?(string, "hgt:") &&
    String.contains?(string, "hcl:") &&
    String.contains?(string, "ecl:") &&
    String.contains?(string, "pid:")
  end

  def v(string) do
    #byr validation
    byr = Regex.named_captures(~r/byr:(?<byr>\d+)/, string)["byr"]
    byr_valid =
      case byr do
        nil -> false
        b -> {bint, ""} = Integer.parse(b)
          (bint > 1920 && bint < 2002)
      end
    #iyr validation
    iyr = Regex.named_captures(~r/iyr:(?<iyr>\d+)/, string)["iyr"]
    iyr_valid =
      case iyr do
        nil -> false
        b -> {bint, ""} = Integer.parse(b)
          (bint > 2010 && bint < 2020)
      end

    #eyr
    eyr = Regex.named_captures(~r/eyr:(?<eyr>\d+)/, string)["eyr"]
    eyr_valid =
      case eyr do
        nil -> false
        b -> {bint, ""} = Integer.parse(b)
          (bint > 2010 && bint < 2020)
      end

    #hgt
    hgt = Regex.named_captures(~r/hgt:(?<hgt>\d+)(cm|in)/, string)["hgt"]




    byr_valid && iyr_valid && eyr_valid
  end
end
