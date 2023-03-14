defmodule StatisticsTest do
  use ExUnit.Case
  doctest Statistics

  test "calc_mean" do
    assert Statistics.calc_mean([1, 1, 1, 1]) == 1
  end
end
