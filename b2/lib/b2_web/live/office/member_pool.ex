defmodule B2Web.Live.Office.MemberPool do
use B2Web, :live_component

    def mount(_params, _session, socket) do
        {:ok, socket}
    end

    def render(assigns) do
        ~H"""
        <div class="pool">
            <%= @member.name %>
        </div>
        """
    end
end