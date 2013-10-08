class Printer

  def header
    "LAST NAME  FIRST NAME  EMAIL  ZIPCODE  CITY  STATE  ADDRESS  PHONE"
  end

  def print_attendee(attendee)
    fields = [:last_name, :first_name, :email, :zipcode, :city, :state, :home_phone]
    fields.collect do |attribue|
      attendee.send(attribue)
    end.join("  ")


    # [attendee.last_name,
    #   attendee.first_name,
    #   attendee.email,
    #   attendee.zipcode,
    #   attendee.city,
    #   attendee.state,
    #   attendee.street,
    #   attendee.home_phone
    # ].join("  ")

    "Schmoe Joe  joe@example.com  80209 Denver  CO  123 First Street  202-555-5555"
  end

end