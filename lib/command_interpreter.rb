class CommandInterpreter
  
  def run(command)
    # load file.csv
    parts = command.split
    instruction = parts[0]
    filename = parts[1]

    [instruction.to_sym, filename]

  end

end