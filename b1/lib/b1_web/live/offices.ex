defmodule B1Web.Live.Offices do

  use B1Web, :live_view

  def mount(_params, _session, socket) do

    offices = AdminRequest.list_offices
    {:ok,
    socket
    |> assign(offices: offices, form_display: "hidden"),
    temporary_assigns: [offices: []]

    }
  end

  def handle_info({:save, %{"office" => office} = params}, socket) do
    IO.inspect(params)
    {:ok, new_office } = AdminRequest.new_office(office["office"])
    {:noreply,
      socket
      |> assign(offices: [office["office"]] , form_display: "hidden")}
    end

  def handle_event("toggle", %{"form_display" => "show"}, socket) do
    IO.inspect(socket.assigns.form_display)
    {:noreply,
      socket
      |> assign(:form_display, "hidden")}
  end

  def handle_event("toggle", %{"form_display" => "hidden"}, socket) do
    IO.inspect(socket.assigns.form_display)
    {:noreply,
      socket
      |> assign(:form_display, "show")}
  end

  def render(assigns) do
    ~H"""
    <div class="m-auto">
    <button id="btn" phx-click="toggle" class="button-10 text-red-500 m-auto mb-5"  phx-value-form_display={assigns.form_display}> Add Office </button>
    <div id="offices" phx-update="replace" class="office_form m-auto">
    <%= if assigns.form_display != "hidden" do %>

    <%= live_component(__MODULE__.OfficeForm, id: "office-form") %>
    <% end %>

    </div>

    <div id="this" class={grid_calculator(length(assigns.offices))<>" m-auto"} phx-update="prepend">

    <%= for office <- assigns.offices do %>
      <%= live_component(__MODULE__.Office, office: office, id: office) %>
    <% end %>

    </div>

    </div>

    """
  end

  defp grid_calculator(offices), do: "grid grid-cols-3 gap-2"
  
end
