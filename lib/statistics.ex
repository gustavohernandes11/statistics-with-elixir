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
end

Statistics.read_file() |> Statistics.calc_mean()
# todo:
# calc_standard_deviation
# calc_standard_deviation_of_mean
# calc_expected_value
# calc_variance
# calc_mean
