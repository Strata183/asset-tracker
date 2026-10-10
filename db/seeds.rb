
# Clear existing records in dependency order
SoftwareLicense.destroy_all
Device.destroy_all
User.destroy_all
Department.destroy_all

# Create departments
hr = Department.create!(name: "HR")
it = Department.create!(name: "IT")
finance = Department.create!(name: "Finance")
operations = Department.create!(name: "Operations")

# Create 30 users with the department totals from the example
first_names = [
  "Bilbo", "Samwise", "Pippin", "Meriadoc", "Frodo",
  "Aragorn", "Legolas", "Gimli", "Gandalf", "Boromir",
  "Faramir", "Eowyn", "Eomer", "Arwen", "Elrond",
  "Galadriel", "Theoden", "Treebeard", "Rosie", "Lobelia",
  "Balin", "Dwalin", "Bifur", "Bofur", "Kili",
  "Fili", "Thorin", "Ori", "Nori", "Dori"
]

last_names = [
  "Baggins", "Gamgee", "Took", "Brandybuck", "Baggins",
  "Elessar", "Greenleaf", "Son of Gloin", "Grey", "Son of Denethor",
  "Steward", "Shieldmaiden", "Marshal", "Undomiel", "Half-elven",
  "Of Lothlorien", "King", "Ent", "Cotton", "Sackville-Baggins",
  "Son of Fundin", "Son of Fundin", "Dwarf", "Dwarf", "Dwarf",
  "Dwarf", "Oakenshield", "Dwarf", "Dwarf", "Dwarf"
]

users = []

30.times do |i|
  department =
    if i < 5
      hr
    elsif i < 19
      it
    elsif i < 27
      finance
    else
      operations
    end

  users << User.create!(
    first_name: first_names[i],
    last_name: last_names[i],
    department: department
  )
end

# Create 40 devices with the department totals from the example.
# Each device is assigned to a randomly selected user in its department.
device_types = ["Laptop", "Desktop", "Tablet", "Phone"]

device_names = [
  "MacBook Pro", "Dell XPS 13", "ThinkPad X1", "Surface Pro"
]

device_department_assignments = [
  [hr, 5],
  [it, 21],
  [finance, 11],
  [operations, 3]
]

device_number = 0

device_department_assignments.each do |department, total|
  department_users = users.select do |user|
    user.department_id == department.id
  end

  total.times do
    Device.create!(
      name: "#{device_names[device_number % device_names.length]} #{device_number + 1}",
      device_type: device_types[device_number % device_types.length],
      user: department_users.sample
    )

    device_number += 1
  end
end

# Create software license assignments
# Available license count is displayed separately on the dashboard.
license_assignments = {
  "Adobe Pro" => 9,
  "Microsoft Office" => 5,
  "Microsoft Windows" => 16
}

license_assignments.each do |name, total|
  total.times do |i|
    SoftwareLicense.create!(
      name: name,
      license_key: "#{name.parameterize.upcase}-#{i + 1}",
      user: users.sample
    )
  end
end

puts "Seed data created successfully!"
puts "Departments: #{Department.count}"
puts "Users: #{User.count}"
puts "Devices: #{Device.count}"
puts "Software license assignments: #{SoftwareLicense.count}"

