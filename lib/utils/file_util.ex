defmodule FileUtil do
  def read_file_to_int_array(file_path) do
    File.stream!(file_path)
    |> Enum.map(&String.trim(&1))
    |> Enum.map(&String.to_integer(&1))
  end
end
