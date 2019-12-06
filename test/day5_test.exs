defmodule Day5Test do
  use ExUnit.Case

  describe "parse_opcode/1" do
    test "parses op codes" do
      assert Day5.parse_opcode("01002") == %{
               operation: :multiply,
               op_mode_1: :position,
               op_mode_2: :immediate,
               op_mode_3: :position
             }
    end

    test "parses op codes with missing op mode characters" do
      assert Day5.parse_opcode("1002") == %{
               operation: :multiply,
               op_mode_1: :position,
               op_mode_2: :immediate,
               op_mode_3: :position
             }

      assert Day5.parse_opcode("02") == %{
               operation: :multiply,
               op_mode_1: :position,
               op_mode_2: :position,
               op_mode_3: :position
             }
    end
  end
  test "program does what its supposed to do" do
    assert Day5.execute(["3","0","4","0","99"], "1337") ==  ["1337","0","4","0","99"]
  end
end
