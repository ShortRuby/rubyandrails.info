class SitemapController < ApplicationController
  def index
    file_name = File.join(Rails.root, 'tmp', 'sitemap.xml').to_s
    
    unless File.exist?(file_name)
      Rails.application.load_tasks
      Rake::Task['sitemap:refresh:no_ping'].invoke
    end
    
    if File.exist?(file_name)
      respond_to do |format|
        format.xml { render file: file_name }
      end
    else
      render file: 'public/404.html', status: :not_found, layout: false
    end
  end
end
