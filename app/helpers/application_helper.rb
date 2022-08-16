module ApplicationHelper
  def default_meta_tags
    {
      site: 'rubyandrails.info',
      keywords: 'ruby, books, podcasts, newsleters, free books, testing, hotwire, for juniors',
      og: {
        site_name: 'rubyandrails.info',
        title: 'Discover Ruby and Ruby on Rails materials',
        description: 'Discover free and paid books, newsletters, podcasts about Ruby & Ruby on Rails in one place.', 
        type: 'website',
        url: request.original_url,
        image: image_url('og_cover.jpg')
      }
    }
  end
end
