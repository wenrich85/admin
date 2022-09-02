defmodule AdminRequest.Runtime.Utilities do

  def via(name) do
    {:via, Registry, {AdminRegistry, name}}
  end

  def list_children(supervisor) do
      Supervisor.which_children(supervisor)
      |> Enum.map(fn x -> elem(x, 1) end)
  end

end
