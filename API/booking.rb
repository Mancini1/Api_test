require 'rest-client'

module Booking

  def all_bookings
    begin
      return RestClient.get 'http://localhost:3001/booking'
    rescue => e
      return e.response
    end
  end

  def specific_booking(id, accept)
    begin
      return RestClient.get 'http://localhost:3001/booking/' + id.to_s, :accept => accept
    rescue => e
      return e.response
    end
  end

end