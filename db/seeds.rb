puts "🌱 Seeding spices..."

# Seed your database here
10.times do
    Author.create(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: Faker::Lorem.characters(number:9, min_alpha:4)
        
        )
end

20.times do

    category = Category.create(
      name: Faker::Book.genre
      
    )
    

    rand(1..5).times do
    
      author = Author.order('RANDOM()').first
  
    
      Post.create(
        title: Faker::Lorem.sentence(word_count: 3),
        content: Faker::Lorem.sentence(word_count: 12),
        author_id: author.id,
        category_id: category.id
      )
    end
  end
  
puts "✅ Done seeding!"
