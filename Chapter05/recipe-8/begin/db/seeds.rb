# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

instructors = [
  {
    name: "Dr. Sarah Johnson",
    email: "s.johnson@university.edu",
    bio: "Professor of Computer Science with 15 years of experience in software engineering and web development.",
    department: "Computer Science"
  },
  {
    name: "Prof. Michael Chen",
    email: "m.chen@university.edu", 
    bio: "Associate Professor specializing in database systems and data analytics.",
    department: "Information Systems"
  },
  {
    name: "Dr. Emily Rodriguez",
    email: "e.rodriguez@university.edu",
    bio: "Assistant Professor focused on machine learning and artificial intelligence.",
    department: "Computer Science"
  },
  {
    name: "Prof. David Kim",
    email: "d.kim@university.edu",
    bio: "Senior lecturer in cybersecurity and network administration.",
    department: "Information Technology"
  }
]

created_instructors = instructors.map do |instructor_data|
  Instructor.find_or_create_by!(email: instructor_data[:email]) do |instructor|
    instructor.name = instructor_data[:name]
    instructor.bio = instructor_data[:bio]
    instructor.department = instructor_data[:department]
  end
end

courses = [
  {
    title: "Introduction to Web Development",
    description: "Learn the fundamentals of HTML, CSS, and JavaScript to build modern web applications.",
    duration: 16,
    credits: 3,
    instructor: created_instructors[0]
  },
  {
    title: "Database Design and Management",
    description: "Comprehensive course covering relational database design, SQL, and database optimization.",
    duration: 14,
    credits: 4,
    instructor: created_instructors[1]
  },
  {
    title: "Machine Learning Fundamentals",
    description: "Introduction to machine learning algorithms, data preprocessing, and model evaluation.",
    duration: 18,
    credits: 3,
    instructor: created_instructors[2]
  },
  {
    title: "Network Security",
    description: "Learn about cybersecurity principles, threat assessment, and security implementation.",
    duration: 12,
    credits: 3,
    instructor: created_instructors[3]
  },
  {
    title: "Advanced Web Frameworks",
    description: "Deep dive into modern web frameworks like React, Vue.js, and backend technologies.",
    duration: 20,
    credits: 4,
    instructor: created_instructors[0]
  },
  {
    title: "Data Analytics and Visualization",
    description: "Learn to analyze large datasets and create meaningful visualizations using modern tools.",
    duration: 15,
    credits: 3,
    instructor: created_instructors[1]
  }
]

courses.each do |course_data|
  Course.find_or_create_by!(title: course_data[:title]) do |course|
    course.description = course_data[:description]
    course.duration = course_data[:duration]
    course.credits = course_data[:credits]
    course.instructor = course_data[:instructor]
  end
end
