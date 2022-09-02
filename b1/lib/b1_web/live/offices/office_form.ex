defmodule B1Web.Live.Offices.OfficeForm do
  use B1Web, :live_component

  def mount(socket) do
    {:ok,
      socket
      |> assign(office: :office)
    }
  end

  def render(assigns) do
    ~H"""
    <div>
    <.form let={f} for={assigns.office} phx-submit="save" phx-target={@myself} >
      <%= label f, :office %>
      <%= text_input f, :office %>

      <%= submit "Save" %>
    </.form>
    </div>
    """
  end

  def handle_event("save", params, socket) do
    IO.puts("Got it boss")
    send self(), {:save, params}
    {:noreply,
    socket
    |> assign(office: :office)}
  end
end
