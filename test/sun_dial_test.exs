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
end
