defmodule Day4Test do
  use ExUnit.Case

  describe "has_duplicate?/1" do
      test "returns true if there is one or more instances of adjacent digits" do
        assert Day4.has_duplicate?("11234567") == true
      end
      test "returns false if there are no adjacent digits" do
        assert Day4.has_duplicate?("1234567") == false
      end
  end

end
