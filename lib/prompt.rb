require './lib/command_interpreter'

class Prompt

  def run
    puts "Welcome to EventReporter!"

    input = nil
    while input != "exit"
      #Print a prompt
      #Get input from user
      #Pass it to the CI

      printf "enter command: "
      input = gets.chomp
      ci = CommandInterpreter.new
      ci.run(input)
    end
  end



end

p = Prompt.new
p.run