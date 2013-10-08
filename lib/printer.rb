class Printer

  def header
    "LAST NAME  FIRST NAME  EMAIL  ZIPCODE  CITY  STATE  ADDRESS  PHONE"
  end

  def print_attendee(attendee)
    [
      attendee.last_name,
      attendee.first_name,
      attendee.email,
      attendee.zipcode,
      attendee.city,
      attendee.state,
      attendee.street,
      attendee.home_phone
    ].join("  ")
  end

  def print_attendees(attendees)
    # call print attendee for each attendee
    # join them with newlines
  
  end


end