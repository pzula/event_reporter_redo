require 'csv'

class AttendeeParser

  attr_reader :attendees
  
  def parse_file(filename)
    data = CSV.open(filename, :headers => true)


    a = Attendee.new(:first_name => "Sam",
                    :last_name => "Johnson",
                    :email => "sam@gmail.com",
                    :home_phone => "720-888-888",
                    :street => "123 First Street",
                    :city => "Denver",
                    :state => "CO",
                    :zipcode => "80204")

    @attendees = [a]
    data.read.count
  end

end


class Attendee

  attr_accessor :first_name, :last_name,
                :email, :home_phone, :street,
                :city, :state, :zipcode


  def initialize(data)
    @first_name     = data[:first_name]
    @last_name      = data[:last_name]
    @email          = data[:email]
    @home_phone     = data[:home_phone]
    @street         = data[:street]
    @city           = data[:city]
    @state          = data[:state]
    @zipcode        = data[:zipcode]
  end
end