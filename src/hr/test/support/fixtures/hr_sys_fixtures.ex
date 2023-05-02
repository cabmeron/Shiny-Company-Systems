defmodule Hr.Hr_sysFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Hr.Hr_sys` context.
  """

  @doc """
  Generate a employee.
  """
  def employee_fixture(attrs \\ %{}) do
    {:ok, employee} =
      attrs
      |> Enum.into(%{
        date_of_hire: ~D[2023-04-29],
        department: "some department",
        employee_identifier: "some employee_identifier",
        first_name: "some first_name",
        last_name: "some last_name"
      })
      |> Hr.Hr_sys.create_employee()

    employee
  end
end
