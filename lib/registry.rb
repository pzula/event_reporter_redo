require './lib/attendee'

class Registry
  
  attr_accessor :attendees

  def find_all_by_first_name(name)
    attendees
  end


end