# frozen_string_literal: true

require 'date'

class CalendarData
  def initialize(date)
    @date = date
  end

  def output
    header + "\n" + body
  end

  private

  def header
    sun_to_sat = 'Su Mo Tu We Th Fr Sa'
    year_and_month = @date.strftime('%B %Y').center(sun_to_sat.size)
    sun_to_sat + "\n" + year_and_month
  end

  def body
    weeks_in_month.map { |week| week.join(' ') }.join("\n")
  end

  def weeks_in_month
    week = 0
    dates_in_month.each_with_object([]) do |date, result|
      if result.empty?
        result << Array.new(7, '  ')
      elsif date.sunday?
        result << []
        week += 1
      end
      result[week][date.wday] = date.day.to_s.rjust(2, ' ')
    end
  end

  def dates_in_month
    (start_date..end_date)
  end

  def start_date
    Date.new(year, month, 1)
  end

  def end_date
    start_date.next_month.prev_day
  end

  def year
    @date.year
  end

  def month
    @date.month
  end
end
