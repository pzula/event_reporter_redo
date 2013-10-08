class CommandInterpreter
  
  ## depencency injection allows dependcy to be specified at load time

  attr_reader :runner_class

  def initialize(runner_input = CommandRunner)
    @runner_class = runner_input
  end

  def runner
    runner_class.new
  end

  def run(command)
    # load file.csv
    parts = command.split
    instruction = parts[0]
    filename = parts[1] || "event_attendees.csv"

    runner.load(filename)
  end

end