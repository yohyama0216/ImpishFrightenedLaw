defmodule PhoenixAppWeb.EmployeeLive.Show do
  use PhoenixAppWeb, :live_view

  alias PhoenixApp.Accounts

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:employee, Accounts.get_employee!(id))}
  end

  defp page_title(:show), do: "Show Employee"
  defp page_title(:edit), do: "Edit Employee"
end
