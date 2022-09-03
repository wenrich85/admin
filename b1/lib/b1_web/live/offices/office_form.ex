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
    <div class="">
    <.form let={f} for={assigns.office} phx-submit="save" phx-target={@myself} >
      <aside>
      <%= label f, :office %>
      <%= text_input f, :office, class: "input" %>
      </aside>
      <%= submit "Save", class: "button-10" %>
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
