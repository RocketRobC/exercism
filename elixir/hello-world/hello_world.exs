defmodule HelloWorld do
  def hello do
    "Hello, World!"
  end

  @spec hello(String.t) :: String.t
  def hello(name) do
    "Hello, #{name}!"
  end
end
