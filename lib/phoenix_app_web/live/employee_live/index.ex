defmodule PhoenixAppWeb.EmployeeLive.Index do
  use PhoenixAppWeb, :live_view

  import PhoenixAppWeb.Helpers.StatusHelper

  alias PhoenixApp.Accounts
  alias PhoenixApp.Accounts.Employee

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :employees, list_employees())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Employee")
    |> assign(:employee, Accounts.get_employee!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Employee")
    |> assign(:employee, %Employee{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Employees")
    |> assign(:employee, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    employee = Accounts.get_employee!(id)
    {:ok, _} = Accounts.delete_employee(employee)

    {:noreply, assign(socket, :employees, list_employees())}
  end

  defp list_employees do
    Accounts.list_employees()
  end
end
