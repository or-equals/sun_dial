defmodule SunDial do
  def format_month(month) when is_integer(month) do
    case month do
      1 -> "January"
      2 -> "February"
      3 -> "March"
      4 -> "April"
      5 -> "May"
      6 -> "June"
      7 -> "July"
      8 -> "August"
      9 -> "September"
      10 -> "October"
      11 -> "November"
      12 -> "December"
    end
  end

  def format_month(month) do
    format_month(String.to_integer(month))
  end

  def format_date(%{year: year, month: month, day: day}), do: "#{month}/#{day}/#{year}"

  def short_date(%{year: year, month: month}), do: "#{slice_and_format_date(month)} #{year}"
  def short_date(%{day: date, month: month}, :date), do: "#{slice_and_format_date(month)} #{date}"
  def short_date(%{day: date, month: month, year: year}, :month_day_year), do: "#{slice_and_format_date(month)} #{date} #{year}"

  defp slice_and_format_date(month) do
    String.slice(format_month(month), 0..2)
  end

  def utc_today_with_offset(offset_amount), do: Date.add(Date.utc_today(), offset_amount)

  def naive_utc_today_with_offset(offset_amount, precision \\ :second) do
    NaiveDateTime.utc_now()
    |> NaiveDateTime.add(offset_amount)
    |> NaiveDateTime.truncate(precision)
  end

  def from_iso8601(date), do: with {:ok, date} <- Date.from_iso8601(date), do: date

  def format_iso8601_date(date), do: date |> from_iso8601() |> format_date()

  def shift_and_format_naive_datetime(naive) do
    naive
    |> naive_to_datetime()
    |> shift_to_est()
    |> Calendar.strftime("%a, %b %d %Y, %I:%M %p %Z")
  end

  def iso8601_to_naive_datetime(date, offset \\ 0) do
    {:ok, date} = Date.from_iso8601(date)
    {:ok, naive_datetime} = NaiveDateTime.new(date, ~T[00:00:00.000])

    NaiveDateTime.add(naive_datetime, offset)
  end

  defp naive_to_datetime(naive), do: DateTime.from_naive!(naive, "Etc/UTC")

  defp shift_to_est(datetime), do:  DateTime.shift_zone!(datetime, "America/New_York", Tzdata.TimeZoneDatabase)
end
