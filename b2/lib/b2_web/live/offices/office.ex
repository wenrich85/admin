defmodule B2Web.Live.Offices.Office do

  use B2Web, :live_component

  def mount(socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""

      <div class= {"office office-animate "<> class() } >
        <p><%= live_redirect @office_symbol, to: Routes.office_path(@socket, :index, @office_symbol) %></p>
      </div>

  """
  end

  defp class(), do: "text-3xl"
end