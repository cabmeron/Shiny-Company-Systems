defmodule HrWeb.EmployeeApiController do
  alias Hr.Hr_sys
  use HrWeb, :controller

  def index(conn, _params) do
    employees = Hr_sys.list_employees()
    render(conn, :index, employees: employees)
  end
end
