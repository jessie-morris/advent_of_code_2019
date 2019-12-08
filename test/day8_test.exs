defmodule Day8Test do
  use ExUnit.Case

  test "combines 4 layers to get 0110" do
    assert(
      Day8.make_picture([
        ["0", "2", "2", "2"],
        ["1", "1", "2", "2"],
        ["2", "2", "1", "2"],
        ["0", "0", "0", "0"]
      ]) == ["0", "1", "1", "0"]
    )
  end
end
