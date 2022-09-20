module ApplicationHelper

  include Pagy::Frontend

  def default_meta_tags
    {
      keywords: 'ruby, books, podcasts, newsleters, free books, testing, hotwire, for juniors',
      og: {
        site_name: 'rubyandrails.info',
        title: 'Discover Ruby and Ruby on Rails materials',
        description: 'Discover free and paid books, newsletters, podcasts about Ruby & Ruby on Rails in one place.', 
        type: 'website',
        url: request.original_url,
        image: image_url('og_cover.jpg')
      },
      twitter: {
        card: "photo",
        image: {
          _: image_url('og_cover.jpg'),
          width: 1200,
          height: 628,
        }
      }
    }
  end

  def related_title(related_title = "More like this")
    base_title = "More like this"
    if related_title.present?
      "#{related_title}"
    else
      base_title
    end
  end

end
