defmodule Day4 do
  def has_duplicate?(password) do
    String.length(password) != Enum.count((Enum.dedup(String.graphemes(password))))
  end

  def 
end
