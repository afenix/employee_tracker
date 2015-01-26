require('spec_buddy')

describe(Division) do
  it("tells which employees are in the division") do
    division = Division.create({ :name => "Barney Frank Division" })
    employee1 = Employee.create({ :name => "Barney Frank", :division_id => division.id })
    expect(division.employees()).to eq([employee1])
  end
end
