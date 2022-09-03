defmodule B2Web.Live.Office do
use B2Web, :live_view

def mount(_params, _session, socket) do
{:ok, socket}
    
end

def handle_params(%{"office" => office_symbol}, _uri, socket) do
    office = AdminRequest.get_state(office_symbol)
    {:noreply, assign(socket, current_office: office)}
end

def render(assigns) do
    ~H"""
    <div>
    <p> <%= @current_office.office %> Requests </p>

    <.live_component module={__MODULE__.RequestPool}  id="request-pool" />
    
    <div id="member-pool" class="grid grid-cols-2 gap-2">
    
    <%= for member<- @current_office.members do %>

        <.live_component module={__MODULE__.MemberPool} member={member} id={member.email} />
    <% end %>
    </div>
    </div>
    
    """
    
end


    
end