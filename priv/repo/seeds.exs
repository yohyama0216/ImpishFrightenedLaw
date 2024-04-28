defmodule PhoenixApp.Repo.Seeds do
  alias PhoenixApp.Repo
  alias PhoenixApp.Accounts.Employee

  # Fakerのインポート
  require Faker

  def truncate_tables do
    # Employees テーブルのデータを全て削除
    #Repo.query!("TRUNCATE TABLE employees RESTART IDENTITY CASCADE", [])
    # SQLiteでは `TRUNCATE TABLE` を使用できないため、DELETEを使用
    Repo.query!("DELETE FROM employees", [])
    # SQLiteの場合、シーケンスのリセットも手動で行う必要がある
    #Repo.query!("DELETE FROM sqlite_sequence WHERE name='employees'", [])
  end

  def seed do
    IO.puts("delete start")
    # truncate_tables を呼び出してからデータを挿入
    truncate_tables()

    # データベースにランダムな従業員データを挿入
    IO.puts("start")
    for _ <- 1..10 do
      employee_params = %{
        employee_id: Faker.UUID.v4(),
        first_name: Faker.Person.first_name(),
        last_name: Faker.Person.last_name(),
        email: Faker.Internet.email(),
        phone_number: Faker.Phone.EnUs.phone(),
        job_title: Faker.Person.title(),
        department: Faker.Company.name(),
        salary: Enum.random(50000..100_000),
        hire_date: Faker.Date.backward(365),
        birth_date: Faker.Date.date_of_birth(18..65),
        status: Enum.random([1, 2])  # 0を除外
      }

      %Employee{}
      |> Employee.changeset(employee_params)
      |> Repo.insert!()
    end
  end
end

PhoenixApp.Repo.Seeds.seed()