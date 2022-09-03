
defmodule B2Web.Live.Offices do

use B2Web, :live_view

require Logger

def mount(_session, _params, socket) do
    IO.inspect(socket)
    {:ok,
    socket
    |> assign(office_symbols: AdminRequest.list_offices),
    temporary_assigns: [office_symbols: []] }
end
    
def render(assigns) do
~H"""
<div>

    <.live_component module={__MODULE__.OfficeForm} id="office_form" />

<div class="office-symbols grid grid-cols-5 gap-3" id="office-symbols" phx-update="prepend">
    <%= for os <- assigns.office_symbols do %>
        <.live_component module={__MODULE__.Office} office_symbol={os} id={os} />
    <% end %>
</div>

</div>
"""
    
end

def handle_info({:save, office}, socket) do
    Logger.debug(office <>" Was saved")
    {:noreply, 
     socket
     |> assign(office_symbols: [office])}
end

def handle_info({:already_exists, office}, socket) do
    Logger.alert(office <>" Already exists")
    {:noreply, socket}
end
end