# SunDial

Date and Time Helpers for Elixir

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `sun_dial` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:sun_dial, "~> 0.3.0"}
  ]
end
```

## Usage

```elixir
# Formatting
SunDial.format_month(3) == "March"
SunDial.format_date(~D[2020-11-01]) == "11/1/2020"
SunDial.format_date(~N[2021-02-17 00:00:23]) == "2/17/2021"
SunDial.short_date(~N[2021-02-17 00:00:23]) == "Feb 2021"

# Transformation
SunDial.utc_today_with_offset(0) == today
SunDial.utc_today_with_offset(1) == tomorrow
SunDial.utc_today_with_offset(-1) == yesterday
SunDial.naive_utc_today_with_offset(86400) == tomorrow_as_naive_date_time # offset is in seconds, 86400 seconds in a day

SunDial.from_iso8601("2022-09-18") == ~D[2022-09-18]
SunDial.format_iso8601_date("2022-09-18") == "9/18/2022"
```
