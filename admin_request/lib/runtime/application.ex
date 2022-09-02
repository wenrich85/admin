defmodule AdminRequest.Runtime.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false
  @office_supervisor OfficeStarter
  @request_supervisor RequestStarter

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {DynamicSupervisor, strategy: :one_for_one, name: @office_supervisor},
      {DynamicSupervisor, strategy: :one_for_one, name: @request_supervisor},
      {Registry, keys: :unique, name: AdminRegistry},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: AdminRequest.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def start_office(office_symbol) do
    DynamicSupervisor.start_child(@office_supervisor, {AdminRequest.Runtime.RequestState, office_symbol})
  end
end
