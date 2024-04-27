defmodule PhoenixAppWeb.EmployeeLive.FormComponent do
  use PhoenixAppWeb, :live_component

  alias PhoenixApp.Accounts

  @impl true
  def update(%{employee: employee} = assigns, socket) do
    changeset = Accounts.change_employee(employee)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"employee" => employee_params}, socket) do
    changeset =
      socket.assigns.employee
      |> Accounts.change_employee(employee_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"employee" => employee_params}, socket) do
    save_employee(socket, socket.assigns.action, employee_params)
  end

  defp save_employee(socket, :edit, employee_params) do
    case Accounts.update_employee(socket.assigns.employee, employee_params) do
      {:ok, _employee} ->
        {:noreply,
         socket
         |> put_flash(:info, "Employee updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_employee(socket, :new, employee_params) do
    case Accounts.create_employee(employee_params) do
      {:ok, _employee} ->
        {:noreply,
         socket
         |> put_flash(:info, "Employee created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
