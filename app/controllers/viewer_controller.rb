class ViewerController < ApplicationController

  in_place_edit_for :page, :body

  def get_unformatted_text
    @page = Page.find(params[:id])
    render :text => @page.body(:source)
  end

  def show
    @page = Page.find_by_name(params[:name])
    @subpages = @page.subpages

    @pagetitle = @page.title
    login_required if @page.admin?

    @areas = Area.find(:all, :order => 'name')
    #@categories = Category.find(:all, :order => 'title')

    if @page.name=='home' then
      @map_body_init=%q{ onload="initialize()" onunload="GUnload()"}
      @markers=""
      unless @areas.empty?
@counter=0
        for a in @areas
          @HtmlPopUpMessage=a.popuptext
          @HtmlPopUpMessage.gsub!(/\n/){"<br>"}
          @HtmlPopUpMessage.gsub!(/\r/){""}
          @counter = @counter +1
          @marker = "marker" + "%d" % @counter
          @markers << "var " + @marker + " = new GMarker(new GLatLng(" + a.location + "));\n"
          @markers << "GEvent.addListener(" + @marker + ", \"click\", function() {" + @marker + ".openInfoWindowHtml(\"" + @HtmlPopUpMessage + "\");});\n"
          @markers << "map.addOverlay(" + @marker + ");\n"
          

        end
        @markers=%q{  <script type="text/javascript">
        }+@markers+%q{
      </script>}
      end

      @map=%q{  <div id="map_canvas" style="width: 800px; height: 600px"></div>
               <script src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=ABQIAAAAf-HhJyENb3Pby8oH3XPARxT2yXp_ZAY8_ufC3CFXhHIE1NvwkxQ_EccYJYji1BeiA65e5umP4mCwng&sensor=true_or_false"
            type="text/javascript"></script>
    <script type="text/javascript">

function initialize() {}
  var map = new GMap2(document.getElementById("map_canvas"));
  map.setCenter(new GLatLng(-33.824794,150.314941), 8);
        map.addControl(new GSmallMapControl());
        map.addControl(new GMapTypeControl());

  // Add 10 markers to the map at random locations
  var bounds = map.getBounds();
  var southWest = bounds.getSouthWest();
  var northEast = bounds.getNorthEast();
  var lngSpan = northEast.lng() - southWest.lng();
  var latSpan = northEast.lat() - southWest.lat();
  


    </script>
  
      }
      @map=@map+@markers
    else
      @map_body_init=""
      @map=''
    end
  end

end
