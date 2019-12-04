defmodule Day4 do
  def has_duplicate?(password) do
    String.length(password) !=
      String.graphemes(password)
      |> Enum.dedup()
      |> Enum.count()
  end

  def ascending_digits?(password) do
  end
end
