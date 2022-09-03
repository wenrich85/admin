defmodule B2Web.Live.Offices.OfficeForm do
  use B2Web, :live_component

  def mount(socket) do
    {:ok,
      socket
      |> assign(office: :office)
    }
  end

  def render(assigns) do
    ~H"""
    <div class="">
    <.form let={f} for={assigns.office} phx-submit="save" phx-target={@myself} >
      <aside>
      <%= label f, :office_symbol %>
      <%= text_input f, :office_symbol, class: "input" %>
      </aside>
      <%= submit "Save", class: "button-10" %>
    </.form>
    </div>
    """
  end

  def handle_event("save", %{"office" => office}=params, socket) do
    create_office(AdminRequest.new_office(office["office_symbol"]), office["office_symbol"])
    {:noreply,
    socket
    |> assign(office: :office)}
  end

  defp create_office({:ok, _office_pid}, office) do
    send self(), {:save, office}
  end

  defp create_office({:error, _}, office) do
    send self(), {:already_exists, office}
    
  end
end