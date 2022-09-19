defmodule SunDialTest do
  use ExUnit.Case

  describe "formatting dates" do
    test "formatting months" do
      assert SunDial.format_month(3) == "March"
      assert SunDial.format_month(1) == "January"
      assert SunDial.format_month("4") == "April"
      assert SunDial.format_month("5") == "May"
    end

    test "formatting DateTime dates" do
      date = ~D[2020-11-01]
      assert SunDial.format_date(date) == "11/1/2020"
    end

    test "formatting NaiveDateTime dates" do
      date = ~N[2021-02-17 00:00:23]
      assert SunDial.format_date(date) == "2/17/2021"
    end

    test "datetime formatting" do
      date = ~U[2021-03-23 12:56:18.653992Z]
      assert SunDial.format_date(date) == "3/23/2021"
    end

    test "short date formatting" do
      date = ~N[2021-02-17 00:00:23]
      assert SunDial.short_date(date) == "Feb 2021"
    end
  end

  describe "date transformations" do
    test "date offset" do
      today = Date.utc_today()
      tomorrow = Date.add(Date.utc_today(), +1)
      yesterday = Date.add(Date.utc_today(), -1)

      assert SunDial.utc_today_with_offset(0) == today
      assert SunDial.utc_today_with_offset(1) == tomorrow
      assert SunDial.utc_today_with_offset(-1) == yesterday
    end

    test "naive offset" do
      # now has more precision; this function only tracks precision to the second
      now = NaiveDateTime.utc_now()
      refute SunDial.naive_utc_today_with_offset(0) == now

      now_with_less_precision = NaiveDateTime.truncate(NaiveDateTime.utc_now(), :second)
      assert SunDial.naive_utc_today_with_offset(0) == now_with_less_precision

      # Exactly one day in the future, 86_400 second
      assert SunDial.naive_utc_today_with_offset(86400) == NaiveDateTime.add(now_with_less_precision, 86400)
    end

    test "iso8601" do
      assert SunDial.from_iso8601("2022-09-18") == ~D[2022-09-18]
      assert SunDial.format_iso8601_date("2022-09-18") == ~D[2022-09-18]
    end
  end
end
