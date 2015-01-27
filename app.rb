require("sinatra/activerecord")
require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/employee")
require("./lib/division")
require("pg")
require("pry")

get("/") do
  @divisions = Division.all()
  erb(:index)
end

post("/division") do
  name = params.fetch("name")
  @division = Division.create({ :name => name })
  @divisions = Division.all()
  erb(:index)
end

get("/division/:id") do
  @division = Division.find(params.fetch("id"))
  erb(:division)
end

post("/employee") do
  name = params.fetch("name")
  division_id = params.fetch("division_id")
  Employee.create({ :name => name, :division_id => division_id })
  redirect("/division/#{division_id}")
end

get("/employee") do
  @employees = Employee.all()
  erb(:division)
end
