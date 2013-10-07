require 'csv'

class AttendeeParser

  attr_reader :attendees
  
  def parse_file(filename)
    data = CSV.open(filename, :headers => true, :header_converters => :symbol)

    line = data.readline

    a = Attendee.new(:first_name => line[:first_name],
                    :last_name => line[:last_name],
                    :email => line[:email_address],
                    :home_phone => line[:homephone],
                    :street => line[:street],
                    :city => line[:city],
                    :state => line[:state],
                    :zipcode => line[:zipcode])

    @attendees = [a]
    data.rewind
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