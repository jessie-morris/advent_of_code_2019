defmodule Day2Test do
  use ExUnit.Case

  test "executes one line program with addition" do
    assert Day2.execute([1, 0, 0, 0, 99]) == [2, 0, 0, 0, 99]
  end

  test "executes one line program with multiplication" do
    assert Day2.execute([2, 3, 0, 3, 99]) == [2, 3, 0, 6, 99]
  end

  test "can write memory outside of the statement" do
    assert Day2.execute([2, 4, 4, 5, 99, 0]) == [2, 4, 4, 5, 99, 9801]
  end

  test "exits program on 99 opcode" do
    assert Day2.execute([1, 0, 0, 0, 99, 0, 0, 0, 99]) == [2, 0, 0, 0, 99, 0, 0, 0, 99]
  end

  test "program overwrites memory so in place 99's dont necessarily mean exits" do
    assert Day2.execute([1, 1, 1, 4, 99, 5, 6, 0, 99]) == [30, 1, 1, 4, 2, 5, 6, 0, 99]
  end

  test "executes back to back commands" do
    assert Day2.execute([1, 0, 0, 0, 1, 0, 0, 0, 99]) == [4, 0, 0, 0, 1, 0, 0, 0, 99]
  end
end
