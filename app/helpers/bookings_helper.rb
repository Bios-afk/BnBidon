module BookingsHelper
  def formatted_booking_price(booking)
    nights = (booking.end_date - booking.start_date).to_i
    price_per_night = booking.flat.price
    total_price = nights * price_per_night

    "#{number_to_currency(total_price)} "\
    "<small class='text-muted'>(#{nights} nights × #{number_to_currency(price_per_night)})</small>".html_safe
end
end
