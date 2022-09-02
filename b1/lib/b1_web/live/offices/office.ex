defmodule B1Web.Live.Offices.Office do

  use B1Web, :live_component

  def mount(socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""

      <div class= {"office office-animate "<> class() } >
        <p><%= assigns.office %></p>
      </div>

  """
  end

  defp class(), do: "text-3xl"
end
