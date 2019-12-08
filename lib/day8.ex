defmodule Day8 do
  def day8_part1 do
    layers = read_file_to_layers()
    min_boy = Enum.min_by(layers, fn layer -> Enum.count(layer, fn pixel -> pixel == "0" end) end)
    Enum.count(min_boy, fn pixel -> pixel == "1" end) * Enum.count(min_boy, fn pixel -> pixel == "2" end)    
  end
  def day8_part2 do
    layers = read_file_to_layers()
    make_picture()
  end

  def read_file_to_layers do
    day8 = File.read!("./day8.txt") |> String.trim()
    Enum.chunk_every(String.graphemes(day8), 150)
  end

  def make_base do
    base = Enum.map(1..150, fn x -> "2" end)
  end

  def make_picture do
    layers = read_file_to_layers
    base = make_base()

    layers_redux = 
    Enum.reduce(layers, base, fn layer, acc ->
      Enum.with_index(layer)
      |> Enum.reduce(base, fn {v, i}, acc ->
        if(Enum.at(base, i) == "2" && v != "2") do
          List.replace_at(acc, i, v)
        else
          acc
        end
      end)
    end)
    IO.inspect(layers_redux, label: "picture", limit: :infinity)
  end
end
