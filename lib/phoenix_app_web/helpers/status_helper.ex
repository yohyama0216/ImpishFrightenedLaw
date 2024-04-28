defmodule PhoenixAppWeb.Helpers.StatusHelper do
  def status_label(status_code) do
    case status_code do
      1 -> "現職"
      2 -> "休職"
      _ -> "退職"
    end
  end
end
