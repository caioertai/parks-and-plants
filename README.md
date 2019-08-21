# Parks and plants 🌴

A livecode done at Le Wagon Melbourne batch#295.

Let's code a Rails app with gardens and plants!

## Usage
Onboarding:
```bash
  cd ~/code/<your_github_nickname>
  git clone git@github.com:caioertai/parks-and-plants-295.git
  cd parks-and-plants-295
  bundle install
  yarn install
  rails db:seed
```
Running the app:
```bash
  rails s
```

## Additional Livecode Info and Resources

### User Stories

```
As a user I can see one garden's plants
As a user I can add a plant in a garden
As a user I can delete a plant
```

### Front End Setup Guidelines

https://github.com/lewagon/rails-stylesheets/blob/master/README.md

### Seeds

```ruby
# db/seeds.rb
Garden.destroy_all if Rails.env.development?

Garden.create!(
  name: "My Little Garden",
  banner_url: "https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/parks-and-plants/garden_1.jpg"
)

Garden.create!(
  name: "My Other Garden",
  banner_url: "https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/parks-and-plants/garden_2.jpg"
)
```

### Le Wagon UI Toolkit

https://uikit.lewagon.com/
