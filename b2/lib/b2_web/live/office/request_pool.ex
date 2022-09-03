defmodule B2Web.Live.Office.RequestPool do
    use B2Web, :live_component

    def mount(_params, _session, socket) do
        {:ok, socket}
    end

    def render(assigns) do
        ~H"""
        <div class="request-pool">
            <h2 class="text-xl font-bold text-center"> Request Pool </h2>
        </div>
        """

        
    end
    
end