defmodule BunnycliTest do
  use ExUnit.Case
  doctest Bunnycli

  test "greets the world" do
    assert Bunnycli.hello() == :world
  end
end
