defmodule Day4Test do
  use ExUnit.Case

  describe "has_duplicate?/1" do
    test "returns true if there is one or more instances of adjacent digits" do
      assert Day4.has_duplicate?("112345") == true
    end

    test "returns false if there are no adjacent duplicate digits" do
      assert Day4.has_duplicate?("123451") == false
    end
  end

  describe "ascending_digits?/1" do
    test "returns true if digits are all the same" do
      assert Day4.ascending_digits?("111111") == true
    end

    test "returns true if digits are ascending only" do
      assert Day4.ascending_digits?("123456") == true
    end

    test "returns false if digits descend" do
      assert Day4.ascending_digits?("123245") == false
    end
  end

  describe "duplicate_contained?/1" do
    test "return false if only duplicate appears more than once in a string" do
      assert Day4.duplicate_contained?("112341") == false
    end

    test "returns true if all duplicate pairs only appear once" do
      assert Day4.duplicate_contained?("112233") == true
    end

    test "returns false if the only duplicate is a triplicate" do
      assert Day4.duplicate_contained?("123444") == false
    end
  end
end
