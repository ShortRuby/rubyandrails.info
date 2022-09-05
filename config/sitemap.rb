# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://rubyandrails.info"
SitemapGenerator::Sitemap.public_path = File.join(Rails.root, 'tmp').to_s
SitemapGenerator::Sitemap.compress = false

SitemapGenerator::Sitemap.create do
  Book.find_each do |book|
    add book_path(book), :lastmod => book.updated_at
  end

  Author.find_each do |author|
    add author_path(author), :lastmod => author.updated_at
  end

  Tag.find_each do |tag|
    add tag_path(tag), :lastmod => tag.updated_at
  end

  Podcast.find_each do |tag|
    add tag_path(tag), :lastmod => tag.updated_at
  end

  Newsletter.find_each do |tag|
    add tag_path(tag), :lastmod => tag.updated_at
  end

  Course.find_each do |tag|
    add tag_path(tag), :lastmod => tag.updated_at
  end

  Book.free_books.find_each do |tag|
    add tag_path(tag), :lastmod => tag.updated_at
  end

  Screencast.free_books.find_each do |tag|
    add tag_path(tag), :lastmod => tag.updated_at
  end

  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
end
