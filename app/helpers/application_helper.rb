module ApplicationHelper
  def get_image model
    model.image.present? ? model.image.image_url.url : Settings.default_image
  end
end
