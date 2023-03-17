# Functions

## match

Resumo: Funções fazem pattern match com os dados de entrada a seus argumentos de maneira independente. Podemos usar isso para atribuir valores a variáveis separadas dentro da função.

handle*result = fn
{:ok, result} -> IO.puts "Handling result..."
{:ok, *} -> IO.puts "This would be never run as previous will be matched beforehand."
{:error} -> IO.puts "An error has occurred!"
end

defp (funções privadas)

## Guards

def hello(name) when is_binary(name) do
phrase() <> name
end

Elixir não gosta de argumentos padrões em múltiplas funções, pode ser confuso. Para lidar com isto, adicionamos funções com nosso argumento padrão:

# Match

%{name: person_name} = %{name: "Fred", age: "95", favorite_color: "Taupe"}

# Pipe

other_function() |> new_function() |> baz() |> bar() |> foo()

Se a aridade de uma função for maior do que 1, certifique-se de usar parênteses.

# Modulos

Argumentos de módulos:
@greeting "Hello"

## Structs

Structs são mapas especiais com um conjunto definido de chaves e valores padrões. Similar a uma classe.

defmodule Example.User do
defstruct name: "Sean", roles: []
end

## Alias

alias Sayings.Greetings, as: Hi

## Import

import List, only: [last: 1]
import List, except: [last: 1]

## Require

Nós podemos usar require para dizer ao Elixir que vamos usar macros de outro módulo. A pequena diferença com import é que ele permite usar macros, mas não funções do módulo especificado.

# Mix

## mix.exs

Aqui nós configuramos nossa aplicação, dependências, ambiente e versão.

```ex

defmodule Example.Mix do
 use Mix.Project

 def project do
   [
     app: :example,
     version: "0.1.0",
     elixir: "~> 1.5",
     start_permanent: Mix.env() == :prod,
     deps: deps()
   ]
 end

 def application do
   [
     extra_applications: [:logger]
   ]
 end

 defp deps do
   []
 end
end

```

### Dependências

```ex

def deps do
 [
   {:phoenix, "~> 1.1 or ~> 1.2"},
   {:phoenix_html, "~> 2.3"},
   {:cowboy, "~> 1.0", only: [:dev, :test]},
   {:slime, "~> 0.14"}
 ]
end

```

mix deps.get
MIX_ENV=prod mix compile

# Sigils

~C Gera uma lista de caracteres sem escape ou interpolação
~c Gera uma lista de caracteres com escape e interpolação

```ex

~c/2 + 7 = #{2 + 7}/
'2 + 7 = 9'

~C/2 + 7 = #{2 + 7}/
'2 + 7 = \#{2 + 7}'

```

~R Gera uma expressão regular sem escape ou interpolação
~r Gera uma expressão regular com escape e interpolação

```ex

re = ~r/elixir/i
~r/elixir/i

"Elixir" =~ re
true

```

(Regex)[https://hexdocs.pm/elixir/Regex.html]

~S Gera strings sem escape ou interpolação
~s Gera string com escape e interpolação

```ex
    ~s/welcome to elixir #{String.downcase "SCHOOL"}/
    "welcome to elixir school"
```

~W Gera uma lista sem escape ou interpolação
~w Gera uma lista com escape e interpolação

```ex
    ~w/i love #{'e'}lixir school/
    ["i", "love", "elixir", "school"]

    ~W/i love #{'e'}lixir school/
    ["i", "love", "\#{'e'}lixir", "school"]
```

~N Gera uma NaiveDateTime struct

# Documentação

```ex
# - Para documentação em linha.
@moduledoc - Para documentação em nível de módulo.
@doc - Para documentação em nível de função.
```

## ExDoc

ExDoc é um projeto oficial do Elixir que produz HTML (Hyper Text Markup Language) e documentação online para projetos Elixir que pode ser encontrado no Github. Primeiro vamos criar um projeto Mix para a nossa aplicação:

mix docs

## Boas práticas:

-   Sempre documente;
-   Caso não documentar, deixe um "false";
-   Quando se referir a funções dentro da documentação de um módulo, use backticks desta forma;
    `` This module also has a `hello/1` function. ``

-   Utilize Markdown;
-   Utilize exemplos;

# Compreehensions

```ex
    list = [1, 2, 3, 4, 5]
    for x <- list, do: x*x
    [1, 4, 9, 16, 25]
```

```ex
# Keyword Lists
    for {_key, val} <- [one: 1, two: 2, three: 3], do: val
    [1, 2, 3]

# Maps
    for {k, v} <- %{"a" => "A", "b" => "B"}, do: {k, v}
    [{"a", "A"}, {"b", "B"}]

# Binaries
    for <<c <- "hello">>, do: <<c>>
    ["h", "e", "l", "l", "o"]
```

```ex

    for {:ok, val} <- [ok: "Hello", error: "Unknown", ok: "World"], do: val
    ["Hello", "World"]

    for n <- list, times <- 1..n, do: IO.puts "#{n} - #{times}"

```

Podem ser usados para filtros:

`for x <- 1..10, is_even(x), do: x `

## Usando into:

```ex
    for c <- [72, 101, 108, 108, 111], into: "", do: <<c>>
    "Hello"
```

# String

Você pode obter o codepoint de um caractere usando ?
?Z  
90

# Data e tempos

Time.utc_now
