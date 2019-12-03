defmodule FileUtil do
  def read_file_to_int_array(file_path) do
    File.stream!(file_path)
    |> Enum.map(&String.trim(&1))
    |> Enum.map(&String.to_integer(&1))
  end

  def read_csv_file_to_int_array(file_path) do
    File.read!(file_path) |> String.split(",") |> Enum.map(&String.to_integer(&1))
  end
  def read_file_into_lines(file_path) do
    File.stream!(file_path)
    |> Enum.to_list()
    |> Enum.map(&String.split(&1, ","))
  end
end
