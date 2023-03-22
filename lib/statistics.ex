defmodule Statistics do
  @moduledoc """
  A module that contains functions for analyzing sample data.
   It is recommended that this data be stored in a .csv file, with only the numbers to be considered in each line.
   The read_file/1 function will be able to read and return these values ​​to the next functions.
  """

  @doc """
  Get the file content and transform into a Enum list

  ## Parameters
  path - the file path

  ## Exemple
  Statistics.read_file("data.csv")

  [37, 36, 54, 37, 39, 23, 58, 51, 40, 47, 26, 48, 30, 36, 45, 22, 42, 21, 26, 43,
  63, 48, 53, 30, 39, 28, 60, 27, 58, 54, 33, 65, 28, 21, 40, 61, 43, 59, 43, 30,
  49, 23, 58, 48, 25, 59, 27, 25, 63, 33, ...]
  """
  def read_file(path \\ "./data.csv") do
    case File.read(path) do
      {:ok, data} ->
        File.read(path)
        data |> String.split() |> Enum.map(&String.to_integer/1)

      {:error, msg} ->
        File.read(path)
        IO.puts("Houve um erro ao ler o arquivo! #{msg}")
    end
  end

  @doc """
  Get a Enum data and return the mean

  ## Parameters
  data - a Enumerable of numbers

  ## Exemple
  Statistics.calc_mean([1, 2, 3, 4])

  2.5
  """
  def calc_mean(data) do
    amount = Enum.count(data)
    acc = Enum.reduce(data, fn el, acc -> el + acc end)
    mean = (acc / amount) |> Float.floor(2)

    mean
  end

  @doc """
  Get a Enum data and return the variance

  ## Parameters
  data - a Enumerable of numbers

  ## Exemple
  Statistics.calc_variance([1, 2, 1, 2, 1, 2])

  0.3
  """
  def calc_variance(data) do
    mean = calc_mean(data)

    sum_of_diference =
      data
      |> Enum.map(fn element -> Float.pow(element - mean, 2) end)
      |> Enum.sum()

    variance = sum_of_diference / (Enum.count(data) - 1)
    variance
  end

  @doc """
  Get a Enum data and return the standard deviation

  ## Parameters
  data - a Enumerable of numbers

  ## Exemple
  Statistics.calc_standard_deviation([1, 2, 3])

  1.0
  """
  def calc_standard_deviation(data) do
    standard_deviation = :math.sqrt(calc_variance(data))
    standard_deviation
  end

  @doc """
  Get a Enum data and return the deviation of mean

  ## Parameters
  data - a Enumerable of numbers

  ## Exemple
  Statistics.calc_standard_deviation_of_mean([1, 2, 3])

  0.5773502691896258
  """
  def calc_standard_deviation_of_mean(data) do
    standard_deviation_of_mean = calc_standard_deviation(data) / :math.sqrt(Enum.count(data))
    standard_deviation_of_mean
  end
end
