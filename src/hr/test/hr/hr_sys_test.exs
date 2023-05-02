defmodule Hr.Hr_sysTest do
  use Hr.DataCase

  alias Hr.Hr_sys

  describe "employees" do
    alias Hr.Hr_sys.Employee

    import Hr.Hr_sysFixtures

    @invalid_attrs %{date_of_hire: nil, department: nil, employee_identifier: nil, first_name: nil, last_name: nil}

    test "list_employees/0 returns all employees" do
      employee = employee_fixture()
      assert Hr_sys.list_employees() == [employee]
    end

    test "get_employee!/1 returns the employee with given id" do
      employee = employee_fixture()
      assert Hr_sys.get_employee!(employee.id) == employee
    end

    test "create_employee/1 with valid data creates a employee" do
      valid_attrs = %{date_of_hire: ~D[2023-04-29], department: "some department", employee_identifier: "some employee_identifier", first_name: "some first_name", last_name: "some last_name"}

      assert {:ok, %Employee{} = employee} = Hr_sys.create_employee(valid_attrs)
      assert employee.date_of_hire == ~D[2023-04-29]
      assert employee.department == "some department"
      assert employee.employee_identifier == "some employee_identifier"
      assert employee.first_name == "some first_name"
      assert employee.last_name == "some last_name"
    end

    test "create_employee/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Hr_sys.create_employee(@invalid_attrs)
    end

    test "update_employee/2 with valid data updates the employee" do
      employee = employee_fixture()
      update_attrs = %{date_of_hire: ~D[2023-04-30], department: "some updated department", employee_identifier: "some updated employee_identifier", first_name: "some updated first_name", last_name: "some updated last_name"}

      assert {:ok, %Employee{} = employee} = Hr_sys.update_employee(employee, update_attrs)
      assert employee.date_of_hire == ~D[2023-04-30]
      assert employee.department == "some updated department"
      assert employee.employee_identifier == "some updated employee_identifier"
      assert employee.first_name == "some updated first_name"
      assert employee.last_name == "some updated last_name"
    end

    test "update_employee/2 with invalid data returns error changeset" do
      employee = employee_fixture()
      assert {:error, %Ecto.Changeset{}} = Hr_sys.update_employee(employee, @invalid_attrs)
      assert employee == Hr_sys.get_employee!(employee.id)
    end

    test "delete_employee/1 deletes the employee" do
      employee = employee_fixture()
      assert {:ok, %Employee{}} = Hr_sys.delete_employee(employee)
      assert_raise Ecto.NoResultsError, fn -> Hr_sys.get_employee!(employee.id) end
    end

    test "change_employee/1 returns a employee changeset" do
      employee = employee_fixture()
      assert %Ecto.Changeset{} = Hr_sys.change_employee(employee)
    end
  end
end
