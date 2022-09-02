defmodule AdminRequestTest do
  use ExUnit.Case
  doctest AdminRequest

  test "greets the world" do
    assert AdminRequest.hello() == :world
  end
end
