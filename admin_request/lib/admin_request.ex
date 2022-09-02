defmodule AdminRequest do

  alias AdminRequest.Runtime.Utilities

  def new_office(office_symbol) do
    AdminRequest.Runtime.Application.start_office(office_symbol)
  end

  def new_member(office, member) do
    GenServer.call(Utilities.via(office), {:add_member, member})
  end

  def list_offices() do
    Utilities.list_children(OfficeStarter)
    |> Enum.map(fn x -> GenServer.call(x, :get_name) end)
  end

  def get_name(office) do
    GenServer.call(office, :get_name)
  end

  def get_state(pid) do
    :sys.get_state(Utilities.via(pid))
  end
end
