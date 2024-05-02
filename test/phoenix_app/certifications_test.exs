defmodule PhoenixApp.CertificationsTest do
  use PhoenixApp.DataCase

  alias PhoenixApp.Certifications

  describe "certifications" do
    alias PhoenixApp.Certifications.Certification

    import PhoenixApp.CertificationsFixtures

    @invalid_attrs %{acquired_date: nil, description: nil, name: nil}

    test "list_certifications/0 returns all certifications" do
      certification = certification_fixture()
      assert Certifications.list_certifications() == [certification]
    end

    test "get_certification!/1 returns the certification with given id" do
      certification = certification_fixture()
      assert Certifications.get_certification!(certification.id) == certification
    end

    test "create_certification/1 with valid data creates a certification" do
      valid_attrs = %{acquired_date: ~D[2024-04-29], description: "some description", name: "some name"}

      assert {:ok, %Certification{} = certification} = Certifications.create_certification(valid_attrs)
      assert certification.acquired_date == ~D[2024-04-29]
      assert certification.description == "some description"
      assert certification.name == "some name"
    end

    test "create_certification/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Certifications.create_certification(@invalid_attrs)
    end

    test "update_certification/2 with valid data updates the certification" do
      certification = certification_fixture()
      update_attrs = %{acquired_date: ~D[2024-04-30], description: "some updated description", name: "some updated name"}

      assert {:ok, %Certification{} = certification} = Certifications.update_certification(certification, update_attrs)
      assert certification.acquired_date == ~D[2024-04-30]
      assert certification.description == "some updated description"
      assert certification.name == "some updated name"
    end

    test "update_certification/2 with invalid data returns error changeset" do
      certification = certification_fixture()
      assert {:error, %Ecto.Changeset{}} = Certifications.update_certification(certification, @invalid_attrs)
      assert certification == Certifications.get_certification!(certification.id)
    end

    test "delete_certification/1 deletes the certification" do
      certification = certification_fixture()
      assert {:ok, %Certification{}} = Certifications.delete_certification(certification)
      assert_raise Ecto.NoResultsError, fn -> Certifications.get_certification!(certification.id) end
    end

    test "change_certification/1 returns a certification changeset" do
      certification = certification_fixture()
      assert %Ecto.Changeset{} = Certifications.change_certification(certification)
    end
  end
end
