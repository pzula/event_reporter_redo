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
      run_queue(parts[1..-1])
    elsif instruction == "help"
      secondary_command = parts[1]
      runner.help(secondary_command)
    end
  end

  def run_queue(fragments)
    case fragments.first
    when "print"
      order = fragments.last
      runner.queue_print(order)
    when "count"
      runner.queue_count
    when "clear"
      runner.queue_clear
    when "save"
      filename = fragments.last
      runner.queue_save(filename)
    end
  end

end