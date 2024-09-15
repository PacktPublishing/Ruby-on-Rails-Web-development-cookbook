# Add gems
gem 'devise'              # Authentication
gem 'pundit'              # Authorization
gem 'tailwindcss-rails'
gem "rails_admin" 
gem "rubocop"

run 'bundle install'

# generate files to install gems
rails_command "tailwindcss:install" 

generate "rails_admin:install", "--namespace=admin"
generate "react_on_rails:install", "--ignore-warnings"

# Run bundle install after gem additions

# Setup Devise for authentication
generate 'devise:install'
generate 'devise User'

# Generate a simple home controller with an index action
generate(:controller, 'home index')

# Add a root route to the generated home controller
route "root to: 'home#index'"

# Setup Pundit for authorization
generate 'pundit:install'

# Add Bootstrap styling
inject_into_file 'app/assets/stylesheets/application.css', before: '*/' do
  <<-CSS
    @tailwind base;
    @tailwind components;
    @tailwind utilities;
  CSS
end

# Scaffold a basic Post resource
generate :scaffold, 'Post title:string body:text user:references'

# Add a simple seed to the database for demonstration purposes
append_to_file 'db/seeds.rb', <<-RUBY
  user = User.create!(email: 'test@example.com', password: 'password')
  Post.create!(title: 'First Post', body: 'This is the first post', user: user)
RUBY

# Create a default database
rake 'db:create'

# Migrate the database to apply Devise changes
rake 'db:migrate'

# Run database seeds to populate sample data
rake 'db:seed'

# Create a Git repository and make the initial commit
git :init
git add: '.'
git commit: "-m 'Initial commit with Rails template'"
