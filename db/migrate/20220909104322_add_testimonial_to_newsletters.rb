class AddTestimonialToNewsletters < ActiveRecord::Migration[7.0]
  def change
    add_column :newsletters, :testimonial_text, :string
    add_column :newsletters, :testimonial_author, :string
    add_column :newsletters, :testimonial_link, :string
  end
end
