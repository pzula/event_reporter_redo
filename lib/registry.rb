require './lib/attendee'

class Registry

  attr_accessor :attendees

  def find_all_by_first_name(name)
    attendees.find_all{|a| a.first_name.downcase == name.downcase}
  end

  def find_all_by_last_name(name)
    attendees.find_all{|a| a.last_name.downcase == name.downcase}
  end

  def find_all_by_email(email)
    attendees.find_all{|a| a.email.downcase == email.downcase}
  end

  def find_all_by_phone(home_phone)
    attendees.find_all{|a|
     a.home_phone.gsub(/\D/, "") == home_phone.gsub(/\D/, "")}
  end

end