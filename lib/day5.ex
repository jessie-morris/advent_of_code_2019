defmodule Day5 do
  def parse_opcode(opcode) do
    IO.inspect(opcode, label: "parsing op code:")
    {op_modes, operation_code} =  String.split_at(opcode, -2)

    operation =
      case String.to_integer(operation_code) do
        1 -> :add
        2 -> :multiply
        3 -> :input
        4 -> :output
        99 -> :exit
      end

    op_mode_1 = String.at(op_modes, String.length(op_modes) - 1) |> parse_op_mode()
    op_mode_2 = String.at(op_modes, String.length(op_modes) - 2) |> parse_op_mode()
    op_mode_3 = String.at(op_modes, String.length(op_modes) - 3) |> parse_op_mode()

    %{operation: operation, op_mode_1: op_mode_1, op_mode_2: op_mode_2, op_mode_3: op_mode_3}
  end

  def parse_op_mode(bit) do
    case bit do
      "1" -> :immediate
      _ -> :position
    end
  end

  # def day5_part1() do
  #   FileUtil.read_csv_file_to_int_array("day5.txt")
  #   |> execute(1337)
  # end

  def execute(program, input) do
    execute_lines(program, 0, input)
  end

  def execute_lines(memory, program_counter, input) do
    IO.inspect(memory, label: "starting execute lines at program counter")
    opcode = Enum.at(memory, program_counter) |> IO.inspect() |> parse_opcode
    IO.inspect(opcode, label: "Got opcode: ")
    statement_length = get_statement_length(opcode.operation)
    statement = Enum.slice(memory, program_counter, statement_length)

    new_memory =
      case opcode.operation do
        # 1 ->
        #   first_operand = Enum.at(memory, Enum.at(statement, 1))
        #   second_operand = Enum.at(memory, Enum.at(statement, 2))
        #   load_address = Enum.at(statement, 3)
        #   List.replace_at(memory, load_address, first_operand + second_operand)

        # 2 ->
        #   first_operand = Enum.at(memory, Enum.at(statement, 1))
        #   second_operand = Enum.at(memory, Enum.at(statement, 2))
        #   load_address = Enum.at(statement, 3)
        #   List.replace_at(memory, load_address, first_operand * second_operand)

        :input ->
          load_address = Enum.at(statement, 1) |> String.to_integer()
          List.replace_at(memory, load_address, input)

        :output ->
          IO.inspect(Enum.at(statement, 1) |> String.to_integer(), label: "OUTPUT")
          memory
          
        :exit ->
          IO.inspect(program_counter, label: "Exiting: Program counter at")
          memory

        catch_all ->
          IO.inspect(catch_all, label: "OpCode on raise:")
          IO.inspect(program_counter, label: "Program counter on raise")
          raise("this shouldnt have happened")
      end
    IO.inspect(Enum.at(memory, program_counter), label: "whattus")
    if(length(memory) >= program_counter + statement_length and Enum.at(memory, program_counter) != "99") do
      execute_lines(new_memory, program_counter + statement_length, input)
    else
      new_memory
    end
  end


  def get_statement_length(operation) do
    case operation do
      :add -> 4
      :multiply -> 4
      :input -> 2
      :output -> 2
      :exit -> 1
    end
  end
end
