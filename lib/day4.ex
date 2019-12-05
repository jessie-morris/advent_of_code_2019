defmodule Day4 do

  def passwords_in_range_part_1(first, last) do
    Enum.reduce(first..last, 0, fn password_num, acc ->
      password_string = Integer.to_string(password_num)
      if(has_duplicate?(password_string) && ascending_digits?(password_string)) do
        acc + 1
      else
        acc
      end
    end)
  end

  def passwords_in_range_part_2(first, last) do
    Enum.reduce(first..last, 0, fn password_num, acc ->
      password_string = Integer.to_string(password_num)
      if(has_duplicate?(password_string) && ascending_digits?(password_string) && duplicate_contained?(password_string)) do
        acc + 1
      else
        acc
      end
    end)
  end

  def has_duplicate?(password) do
    String.graphemes(password)
    |> Enum.dedup()
    |> Enum.count() != String.length(password)
  end

  def ascending_digits?(password) do
    digits = string_to_int_array(password)

    Enum.reduce(digits, %{ascending: true, last_digit: 0}, fn x, acc ->
      if(acc.ascending == true && acc.last_digit <= x) do
        acc = %{ascending: true, last_digit: x}
      else
        acc = %{ascending: false, last_digit: x}
      end
    end)
    |> Map.get(:ascending)
  end

  def duplicate_contained?(password) do
    digits = string_to_int_array(password)
    pairs = pairs_in_digits(digits)

    Enum.any?(pairs, fn pair -> Enum.count(digits, fn digit -> digit == pair end) == 2 end)
  end

  def pairs_in_digits(digits) do
      Enum.reduce(digits, %{pairs_found: [], last_digit: nil}, fn digit, acc ->
        if(digit == acc.last_digit && !Enum.member?(acc.pairs_found, digit)) do
          %{pairs_found: [digit | acc.pairs_found], last_digit: digit}
        else
          %{pairs_found: acc.pairs_found, last_digit: digit}
        end
      end)
      |> Map.get(:pairs_found)
  end

  def string_to_int_array(string) do
    String.graphemes(string) |> Enum.map(&String.to_integer/1)
  end
end
