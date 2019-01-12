module ApplicationHelper
  def get_image model
     model.image.present? ? model.image.image_url.url : "user8"
  end
end
