require './lib/attendee'

class Registry

  attr_accessor :attendees

  def find_all_by_first_name(name)
    attendees.find_all{|a| a.first_name.downcase == name.downcase}
  end

  def find_all_by_last_name(name)
    attendees
  end


end