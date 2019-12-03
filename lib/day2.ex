defmodule Day2 do
  def day2_part2() do
    initial_program = FileUtil.read_csv_file_to_int_array("day2.txt")

    list_of_results =
      Enum.map(0..99, fn noun ->
        Enum.map(0..99, fn verb ->
          altered_program = List.replace_at(initial_program, 1, noun) |> List.replace_at(2, verb)
          {
            Enum.at(execute(altered_program), 0),
              Integer.to_string(noun) <> ":" <> Integer.to_string(verb)
          }
        end)
      end)
      |> List.flatten

      Enum.find(list_of_results, fn {x,y} -> x == 19_690_720 end)
  end

  def day2_part1() do
    initial_program = FileUtil.read_csv_file_to_int_array("day2.txt")
    altered_program = List.replace_at(initial_program, 1, 12) |> List.replace_at(2, 2)
    execute(altered_program)
  end

  def execute(program) do
    execute_lines(program, 0)
  end

  def execute_lines(memory, program_counter) do
    statement = Enum.slice(memory, program_counter, 4)
    operation = Enum.at(statement, 0)

    new_memory =
      case operation do
        1 ->
          first_operand = Enum.at(memory, Enum.at(statement, 1))
          second_operand = Enum.at(memory, Enum.at(statement, 2))
          load_address = Enum.at(statement, 3)
          List.replace_at(memory, load_address, first_operand + second_operand)

        2 ->
          first_operand = Enum.at(memory, Enum.at(statement, 1))
          second_operand = Enum.at(memory, Enum.at(statement, 2))
          load_address = Enum.at(statement, 3)
          List.replace_at(memory, load_address, first_operand * second_operand)

        99 ->
          # IO.inspect(program_counter, label: "Program counter at")
          memory

        catch_all ->
          IO.inspect(catch_all, label: "OpCode on raise:")
          IO.inspect(program_counter, label: "Program counter on raise")
          raise("this shouldnt have happened")
      end

    if(length(memory) >= program_counter + 4 and Enum.at(memory, program_counter) != 99) do
      execute_lines(new_memory, program_counter + 4)
    else
      new_memory
    end
  end
end
