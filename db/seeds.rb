# Seeding data for Students
students = [
  { first_name: "Alice", last_name: "Johnson", email: "alice.johnson@example.com", phone_number: "123-456-7890", short_bio: "Web developer with a passion for Ruby on Rails.", linkedin_url: "https://linkedin.com/in/alicejohnson", twitter_handle: "@alicej", personal_url: "http://alicejohnson.com", resume_url: "http://alicejohnson.com/resume.pdf", github_url: "https://github.com/alicej", photo: "path/to/photo1.jpg", password_digest: "somehashedpassword" },
  { first_name: "Bob", last_name: "Smith", email: "bob.smith@example.com", phone_number: "098-765-4321", short_bio: "Data analyst and Python enthusiast.", linkedin_url: "https://linkedin.com/in/bobsmith", twitter_handle: "@bobs", personal_url: "http://bobsmith.com", resume_url: "http://bobsmith.com/resume.pdf", github_url: "https://github.com/bobs", photo: "path/to/photo2.jpg", password_digest: "somehashedpassword2" }
]

students.each do |student|
  Student.create!(student)
end

# Seeding data for Skills
skills = ["Ruby on Rails", "JavaScript", "Python", "Data Analysis"]
skills.each do |skill|
  Skill.create!(skill_name: skill)
end

# Seeding data for Capstones
capstones = [
  { name: "E-commerce Platform", description: "A fully functional e-commerce website built with Ruby on Rails.", url: "http://exampleecommerce.com", screenshot: "path/to/screenshot1.jpg" },
  { name: "Analytics Dashboard", description: "A dashboard for visualizing user behavior on websites.", url: "http://exampledashboard.com", screenshot: "path/to/screenshot2.jpg" }
]

capstones.each do |capstone|
  Capstone.create!(capstone)
end

# Seeding data for Educations
educations = [
  { start_date: Date.new(2018, 9, 1), end_date: Date.new(2022, 6, 30), degree: "Bachelor of Science in Computer Science", university_name: "State University", details: "Specialized in software development and system architecture." },
  { start_date: Date.new(2015, 9, 1), end_date: Date.new(2019, 6, 30), degree: "Bachelor of Arts in Economics", university_name: "Liberal Arts College", details: "Focused on econometrics and economic theory." }
]

educations.each do |education|
  Education.create!(education)
end

# Seeding data for Experiences
experiences = [
  { start_date: Date.new(2022, 7, 1), end_date: Date.new(2024, 4, 15), job_title: "Junior Developer", company_name: "Tech Solutions Inc.", details: "Worked on developing and maintaining various SaaS products." },
  { start_date: Date.new(2019, 8, 1), end_date: Date.new(2022, 6, 30), job_title: "Research Assistant", company_name: "University Research Center", details: "Assisted in research on economic models and data analytics." }
]

experiences.each do |experience|
  Experience.create!(experience)
end

puts "Database has been seeded!"
