namespace :articles do
  desc "Update article slugs"
  task update_slugs: :environment do
    Article.find_each do |article|
      if article.slug.blank?
        article.update!(slug: article.title.parameterize)
        puts "Updated slug for: #{article.title}"
      end
    end
    puts "Slug update complete!"
  end
end