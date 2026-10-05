it = Department.create!(name: 'IT')
operations = Department.create!(name: 'Operations')
finance = Department.create!(name: 'Finance')

User.create!(first_name: 'Bilbo', last_name: 'Baggins', department: it)
User.create!(first_name: 'Samwise', last_name: 'Gamgee', department: operations)
User.create!(first_name: 'Pippin', last_name: 'Took', department: operations)
User.create!(first_name: 'Meriadoc', last_name: 'Brandybuck', department: finance)
