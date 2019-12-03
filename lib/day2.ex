defmodule Day2 do
  def execute(program) do
    execute_lines(program, program)
  end

  def execute_lines(memory, remaining_statements) do
    statement = Enum.take(remaining_statements, 4) |> IO.inspect(label: "Executing")
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
        
        99 -> memory

        _ ->
          raise("this shouldnt have happened")
      end

    if(length(remaining_statements) >= 4) do
      {_, new_remaining_statements} = Enum.split(remaining_statements, 4)
      IO.inspect(new_memory)
      execute_lines(new_memory, new_remaining_statements)
    else
      new_memory
    end
  end
end
