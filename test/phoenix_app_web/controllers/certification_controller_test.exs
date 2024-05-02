defmodule PhoenixAppWeb.CertificationControllerTest do
  use PhoenixAppWeb.ConnCase

  import PhoenixApp.CertificationsFixtures

  @create_attrs %{acquired_date: ~D[2024-04-29], description: "some description", name: "some name"}
  @update_attrs %{acquired_date: ~D[2024-04-30], description: "some updated description", name: "some updated name"}
  @invalid_attrs %{acquired_date: nil, description: nil, name: nil}

  describe "index" do
    test "lists all certifications", %{conn: conn} do
      conn = get(conn, Routes.certification_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Certifications"
    end
  end

  describe "new certification" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.certification_path(conn, :new))
      assert html_response(conn, 200) =~ "New Certification"
    end
  end

  describe "create certification" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.certification_path(conn, :create), certification: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.certification_path(conn, :show, id)

      conn = get(conn, Routes.certification_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Certification"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.certification_path(conn, :create), certification: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Certification"
    end
  end

  describe "edit certification" do
    setup [:create_certification]

    test "renders form for editing chosen certification", %{conn: conn, certification: certification} do
      conn = get(conn, Routes.certification_path(conn, :edit, certification))
      assert html_response(conn, 200) =~ "Edit Certification"
    end
  end

  describe "update certification" do
    setup [:create_certification]

    test "redirects when data is valid", %{conn: conn, certification: certification} do
      conn = put(conn, Routes.certification_path(conn, :update, certification), certification: @update_attrs)
      assert redirected_to(conn) == Routes.certification_path(conn, :show, certification)

      conn = get(conn, Routes.certification_path(conn, :show, certification))
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, certification: certification} do
      conn = put(conn, Routes.certification_path(conn, :update, certification), certification: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Certification"
    end
  end

  describe "delete certification" do
    setup [:create_certification]

    test "deletes chosen certification", %{conn: conn, certification: certification} do
      conn = delete(conn, Routes.certification_path(conn, :delete, certification))
      assert redirected_to(conn) == Routes.certification_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.certification_path(conn, :show, certification))
      end
    end
  end

  defp create_certification(_) do
    certification = certification_fixture()
    %{certification: certification}
  end
end
