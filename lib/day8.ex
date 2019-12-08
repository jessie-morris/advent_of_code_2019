defmodule Day8 do
  def day8_part1(width \\ 25, height \\ 6) do
    layers = read_file_to_layers(width * height)
    min_boy = Enum.min_by(layers, fn layer -> Enum.count(layer, fn pixel -> pixel == "0" end) end)

    Enum.count(min_boy, fn pixel -> pixel == "1" end) *
      Enum.count(min_boy, fn pixel -> pixel == "2" end)
  end

  def read_file_to_layers(layer_size) do
    input = File.read!("./day8.txt") |> String.trim()
    Enum.chunk_every(String.graphemes(input), layer_size)
  end

  def day8_part2(width \\ 25, height \\ 6) do
    layers = read_file_to_layers(width * height)
    make_picture(layers)
    |> pretty_print(width)
  end

  def make_base(size) do
    base = Enum.map(1..size, fn x -> "2" end)
  end

  def make_picture(layers) do
    base = make_base(length(List.first(layers)))

    layers_redux =
      Enum.reduce(layers, base, fn layer, full_picture_acc ->
        Enum.with_index(layer)
        |> Enum.reduce(full_picture_acc, fn {v, i}, layer_acc ->
          if(Enum.at(layer_acc, i) == "2" && v != "2") do
            List.replace_at(layer_acc, i, v)
          else
            layer_acc
          end
        end)
      end)
  end

  def pretty_print(pixels, width) do
    Enum.chunk_every(pixels, width)
    |> Enum.map(fn arr -> Enum.join(arr) end)
    |> Enum.join("\n")
    |> String.replace("0", " ")
    |> String.replace("1", "#")
    |> IO.puts()
  end
end
