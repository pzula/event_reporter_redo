require './lib/command_interpreter'

class Prompt

  def self.run
    puts "Welcome to EventReporter!"
    ci = CommandInterpreter.new

    input = nil
    while input != "exit"
      #Print a prompt
      #Get input from user
      #Pass it to the CI

      printf "enter command: "
      input = gets.chomp
      puts ci.run(input)
    end
  end



end

Prompt.run