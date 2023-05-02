defmodule HrWeb.EmployeeApiJSON do
  def index(%{employees: employees}) do
    %{
      data:
        for(employee <- employees) do
          %{
            id: employee.id,
            EmployeeID: employee.employee_identifier,
            last_name: employee.last_name,
            first_name: employee.first_name,
            Date_of_hire: employee.date_of_hire,
            Department: employee.department
          }
        end
    }
  end
end
