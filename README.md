Backport Active Support's new DateTime Calculations from Rails 5.

https://github.com/rails/rails/pull/18335

Add `#prev_day` and `#next_day` counterparts to `#yesterday` and
`#tomorrow` for `Date`, `Time`, and `DateTime`.

Add `same_time` option to `#next_week` and `#prev_week` for `Date`, `Time`,
and `DateTime`.

Add `#on_weekend?`, `#next_weekday`, `#prev_weekday` methods to `Date`,
`Time`, and `DateTime`.

`#on_weekend?` returns true if the receiving date/time falls on a Saturday
or Sunday.

`#next_weekday` returns a new date/time representing the next day that does
not fall on a Saturday or Sunday.

`#prev_weekday` returns a new date/time representing the previous day that
does not fall on a Saturday or Sunday.


#Installation

Add this line to your application's Gemfile:

```ruby
gem 'backport_activesupport_time_calculations'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install backport_activesupport_time_calculations
