class Printer

  def header
    "LAST NAME  FIRST NAME  EMAIL  ZIPCODE  CITY  STATE  ADDRESS  PHONE"
  end

  def print_attendee(attendee)
    #pull the attributes
    # make sure they're in the right order
    # put it in a string with "  " in between
    [attendee.last_name,
      attendee.first_name,
      attendee.email,
      attendee.zipcode,
      attendee.city,
      attendee.state,
      attendee.street,
      attendee.home_phone
    ].join("  ")

    "Schmoe Joe  joe@example.com  80209 Denver  CO  123 First Street  202-555-5555"
  end

end