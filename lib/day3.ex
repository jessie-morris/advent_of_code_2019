defmodule Day3 do
  def execute() do
    [path1, path2] = FileUtil.read_file_into_lines("day3.txt")
    calculate_distance(path1, path2)
  end
  def calculate_distance(path1, path2) do
    FileUtil.read_file_into_lines("day3.txt")
    path1_points = get_points(path1) |> MapSet.new() 
    path2_points = get_points(path2) |> MapSet.new()

    shared_points = MapSet.intersection(path1_points, path2_points)

    Enum.map(shared_points, fn point -> manhattan_distance(point, {0,0}) end)
    |> Enum.reject(fn x -> x == 0 end)
    |> Enum.min()
  end

  def get_points(path) do
    Enum.reduce(path, [{0,0}], fn movement, acc ->
      acc ++ move(acc, movement)
    end)
  end
  def move(position_list, movement) do
    {oldX, oldY} = List.last(position_list)
    {direction, str_magnitude} = String.split_at(movement, 1)
    magnitude = String.to_integer(str_magnitude)
    case direction do
      "R" -> Enum.map(oldX..oldX + magnitude, fn x -> {x, oldY} end)
      "L" -> Enum.map(oldX..oldX - magnitude, fn x -> {x, oldY} end)
      "U" -> Enum.map(oldY..oldY + magnitude, fn y -> {oldX, y} end)
      "D" -> Enum.map(oldY..oldY - magnitude, fn y -> {oldX, y} end)
    end
  end

  def manhattan_distance(point1, point2) do
    {x1, y1} = point1
    {x2, y2} = point2

    abs(x1 - x2) + abs(y1 - y2)
  end
end