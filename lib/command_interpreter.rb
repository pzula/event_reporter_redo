class CommandInterpreter
  
  ## depencency injection allows dependcy to be specified at load time

  attr_reader :runner_class

  def initialize(runner_input = CommandRunner)
    @runner_class = runner_input
  end

  def runner
    runner_class.new
  end

  def default_filename
    "event_attendees.csv"
  end

  def run(command)
    # load file.csv
    parts = command.split
    instruction = parts[0]

    if instruction == "load"
      filename = parts[1] || default_filename
      runner.load(filename)
    elsif instruction == "queue"
      if parts[1] == "print"
        order = parts.last
        runner.queue_print(order)
      elsif parts[1] == "count"
        runner.queue_count
      end
    end
  end

end