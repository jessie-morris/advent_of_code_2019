defmodule Day3 do
  def execute() do
    [path1, path2] = FileUtil.read_file_into_lines("day3.txt")
    IO.inspect(calculate_distance(path1, path2), label: "total distance")
    IO.inspect(calculate_manhattan_distance(path1,path2), label: "manhattan distance")
  end
  def calculate_distance(path1, path2) do
    FileUtil.read_file_into_lines("day3.txt")
    path1_points_and_distance = get_points(path1)
    path2_points_and_distance = get_points(path2)

    path1_points = Enum.map(path1_points_and_distance, fn {x,y,_} -> {x,y} end) |> MapSet.new
    path2_points = Enum.map(path2_points_and_distance, fn {x,y,_} -> {x,y} end) |> MapSet.new

    shared_points = MapSet.intersection(path1_points |> MapSet.new, path2_points)

    {distance1, distance2} = 
    Enum.map(shared_points, fn point -> {distance_to_point(path1_points_and_distance, point), distance_to_point(path2_points_and_distance, point)} end)
    |> Enum.reject(fn x -> x == {0,0} end)
    |> Enum.min_by(fn {a,b} -> a * b end)

    distance1 + distance2

    # Enum.map(shared_points, fn point -> manhattan_distance(point, {0,0}) end)
    # |> Enum.reject(fn x -> x == 0 end)
    # |> Enum.min()
  end

  def calculate_manhattan_distance(path1, path2) do
    FileUtil.read_file_into_lines("day3.txt")
    path1_points_and_distance = get_points(path1)
    path2_points_and_distance = get_points(path2)

    path1_points = Enum.map(path1_points_and_distance, fn {x,y,_} -> {x,y} end) |> MapSet.new
    path2_points = Enum.map(path2_points_and_distance, fn {x,y,_} -> {x,y} end) |> MapSet.new 

    shared_points = MapSet.intersection(path1_points |> MapSet.new, path2_points)

    Enum.map(shared_points, fn point -> manhattan_distance(point, {0,0}) end)
    |> Enum.reject(fn x -> x == 0 end)
    |> Enum.min() 
  end

  def distance_to_point(points_and_distance, point) do
    Enum.find(points_and_distance, fn {x,y,_} -> x == elem(point, 0) && y == elem(point, 1) end)
    |> elem(2)
  end

  def get_points(path) do
    Enum.reduce(path, [{0,0,0}], fn movement, acc ->
      acc ++ move(acc, movement)
    end)
  end
  def move(position_list, movement) do
    {oldX, oldY, current_distance} = List.last(position_list)
    {direction, str_magnitude} = String.split_at(movement, 1)
    magnitude = String.to_integer(str_magnitude)
    case direction do
      "R" -> Enum.map(oldX..oldX + magnitude, fn x -> {x, oldY, current_distance + (x - oldX)} end)
      "L" -> Enum.map(oldX..oldX - magnitude, fn x -> {x, oldY, current_distance + (oldX - x)} end)
      "U" -> Enum.map(oldY..oldY + magnitude, fn y -> {oldX, y, current_distance + (y - oldY)} end)
      "D" -> Enum.map(oldY..oldY - magnitude, fn y -> {oldX, y, current_distance + (oldY - y)} end)
    end
  end

  def manhattan_distance(point1, point2) do
    {x1, y1} = point1
    {x2, y2} = point2

    abs(x1 - x2) + abs(y1 - y2)
  end
end