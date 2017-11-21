module AttractionsHelper
  def display_attractions_list(attractions)
    content_tag_for(:li, attractions) do |attraction|
      if current_user.admin
        link_to "Show #{attraction.name}", attraction_path(attraction)
      else
        link_to "Go on #{attraction.name}", attraction_path(attraction)
      end
    end
  end
end
