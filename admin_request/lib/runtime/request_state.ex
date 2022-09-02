defmodule AdminRequest.Runtime.RequestState do

  use GenServer

  import AdminRequest.Impl.Member
  alias AdminRequest.Runtime.Utilities



  def start_link(office_symbol) do
    GenServer.start_link(__MODULE__, office_symbol, name: Utilities.via(office_symbol))
  end

  @impl true
  def init(office_symbol) do
    {:ok,
      %{
        requests: MapSet.new(),
        members: MapSet.new(),
        office: office_symbol
      }
    }
  end

  @impl true
  def handle_call({:add_member, member}, _from, office ) do
    add_member(new(member), office)
  end

  def handle_call({:add_request, request}, _from, office) do
    new_office = add_request(office, request)
    {:reply, new_office, new_office}
  end

  def handle_call(:get_name, _from, office) do
    {:reply, office.office, office}
  end

  def child_spec(office_symbol) do
    %{ id: Utilities.via(office_symbol),
      start: {__MODULE__, :start_link, [office_symbol]},
    }
  end

  defp add_request(office, request) do
    Map.put(office, :requests, request )
  end

  defp add_member({:error, _}, office) do
    {:reply, "There was an error adding this member", office}
  end

  defp add_member({:ok, member}, office) do
    {:reply,
      "#{member.name} was added as a member to #{office.office}.",
      Map.put(office, :members, MapSet.put(office.members, member))
    }
  end
end
