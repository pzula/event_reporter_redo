require 'csv'

class AttendeeParser

  attr_reader :attendees
  
  def parse_file(filename)
    data = CSV.open(filename, :headers => true, :header_converters => :symbol)

    @attendees = data.collect {|line| build_attendees(line) }

    @attendees.count
  end

  def build_attendees(line)
    Attendee.new(:first_name => line[:first_name],
                      :last_name => line[:last_name],
                      :email => line[:email_address],
                      :home_phone => line[:homephone],
                      :street => line[:street],
                      :city => line[:city],
                      :state => line[:state],
                      :zipcode => line[:zipcode])
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