# Helpers for portfolio
module PortfoliosHelper
  def image_generator(height, width)
    "http://placehold.it/#{height}x#{width}"
  end

  def portfolio_img(img, type)
    if img.model.main_image? || img.model.thumb_image?
      img
    elsif type == 'thumb'
      image_generator(350, 200)
    elsif type == 'main'
      image_generator(600, 400)
    end
  end
end
