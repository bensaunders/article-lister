module ArticlesHelper
  def map_url(location)
    "https://maps.googleapis.com/maps/api/staticmap?zoom=15&size=180x180&markers=color:0x00A69C%7C#{location['latitude']},#{location['longitude']}&key=AIzaSyDzHVPnDtNW2h897_6myjLvmd6XClSkCvA"
  end
end
