require("spec_buddy")

describe(Employee) do

  it("will return the division that the employee belongs to") do
    division = Division.create({:name => "Barney Frank Division"})
    employee = Employee.create({:name => "Barney Frank", :division_id => division.id})
    expect(employee.division()).to eq(division)
  end
end
