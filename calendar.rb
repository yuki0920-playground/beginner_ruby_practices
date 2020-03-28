# frozen_string_literal: true

require 'date'

today = Date.today
year = today.year
month = today.month
next_month = today.month + 1

start_date = Date.new(year, month, 1)
end_date = Date.new(year, next_month, 1) - 1
puts today.strftime('%B %Y').center(20)
puts 'Su Mo Tu We Th Fr Sa'

(start_date..end_date).each_with_object(Array.new(7, '  ')) do |date, result|
  result[date.wday] = date.day.to_s.rjust(2, ' ')
  if date.day == end_date.day
    puts result[0..date.wday].join(' ')
  elsif date.wday == 6
    puts result.join(' ')
  end
end
