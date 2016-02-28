require 'rails'

module DateAndTime
  module Calculations
    # Add `#prev_day` and `#next_day` counterparts to `#yesterday` and
    #`#tomorrow` for `Date`, `Time`, and `DateTime`.
    #
    # Add `same_time` option to `#next_week` and `#prev_week` for `Date`, `Time`,
    # and `DateTime`.
    #
    # Add `#on_weekend?`, `#next_weekday`, `#prev_weekday` methods to `Date`,
    #`Time`, and `DateTime`.
    #
    # `#on_weekend?` returns true if the receiving date/time falls on a Saturday
    # or Sunday.
    #
    # `#next_weekday` returns a new date/time representing the next day that does
    # not fall on a Saturday or Sunday.
    #
    # `#prev_weekday` returns a new date/time representing the previous day that
    # does not fall on a Saturday or Sunday.
    #
    # https://github.com/rails/rails/pull/18335

    WEEKEND_DAYS = [ 6, 0 ]

    # Returns a new date/time representing the next day.
    def next_day
      advance(days: 1)
    end

    # Returns true if the date/time falls on a Saturday or Sunday.
    def on_weekend?
      wday.in?(WEEKEND_DAYS)
    end

    # Returns a new date/time representing the given day in the next week.
    # The +given_day_in_next_week+ defaults to the beginning of the week
    # which is determined by +Date.beginning_of_week+ or +config.beginning_of_week+
    # when set. +DateTime+ objects have their time set to 0:00 unless +same_time+ is true.
    def next_week(given_day_in_next_week = Date.beginning_of_week, same_time: false)
      result = first_hour(weeks_since(1).beginning_of_week.days_since(days_span(given_day_in_next_week)))
      same_time ? copy_time_to(result) : result
    end

    # Returns a new date/time representing the next weekday.
    def next_weekday
      if next_day.on_weekend?
        next_week(:monday, same_time: true)
      else
        next_day
      end
    end

    # Returns a new date/time representing the given day in the previous week.
    # Week is assumed to start on +start_day+, default is
    # +Date.beginning_of_week+ or +config.beginning_of_week+ when set.
    # DateTime objects have their time set to 0:00 unless +same_time+ is true.
    def prev_week(start_day = Date.beginning_of_week, same_time: false)
      result = first_hour(weeks_ago(1).beginning_of_week.days_since(days_span(start_day)))
      same_time ? copy_time_to(result) : result
    end

    # Returns a new date/time representing the previous weekday.
    def prev_weekday
      if prev_day.on_weekend?
        copy_time_to(beginning_of_week(:friday))
      else
        prev_day
      end
    end
    alias_method :last_weekday, :prev_weekday

    private

    def copy_time_to(other)
      other.change(hour: hour, min: min, sec: sec, usec: try(:usec))
    end

  end
end
