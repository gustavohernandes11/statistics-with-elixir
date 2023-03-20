defmodule Statistics do
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

  def calc_mean(data) do
    amount = Enum.count(data)
    acc = Enum.reduce(data, fn el, acc -> el + acc end)
    mean = (acc / amount) |> Float.floor(2)

    mean
  end

  def calc_variance(data) do
    mean = calc_mean(data)

    sum_of_diference =
      data
      |> Enum.map(fn element -> Float.pow(element - mean, 2) end)
      |> Enum.sum()

    variance = sum_of_diference / (Enum.count(data) - 1)
    variance
  end

  def calc_standard_deviation(data) do
    standard_deviation = :math.sqrt(calc_variance(data))
    standard_deviation
  end

  def calc_standard_deviation_of_mean(data) do
    standard_deviation_of_mean = calc_standard_deviation(data) / :math.sqrt(Enum.count(data))
    standard_deviation_of_mean
  end
end

Statistics.read_file() |> Statistics.calc_mean()
# todo:
# [x] calc_standard_deviation
# [x] calc_standard_deviation_of_mean
# [x] calc_variance
# [x] calc_mean
