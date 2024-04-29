defmodule PhoenixAppWeb.Helpers.StatusHelper do
  def status_label(status_code) do
    case status_code do
      1 -> "入社予定"
      2 -> "現職"
      3 -> "休職"
      4 -> "退職予定"
      0 -> "退職済み"
    end
  end
end
