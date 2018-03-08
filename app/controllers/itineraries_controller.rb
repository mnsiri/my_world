class ItinerariesController < ApplicationController
  def index
    @itineraries = Itinerary.all

    render("itineraries/index.html.erb")
  end

  def show
    @itinerary = Itinerary.find(params[:id])

    render("itineraries/show.html.erb")
  end

  def new
    @itinerary = Itinerary.new

    render("itineraries/new.html.erb")
  end

  def create
    @itinerary = Itinerary.new

    @itinerary.user_id = params[:user_id]
    @itinerary.photo_id = params[:photo_id]
    @itinerary.category_id = params[:category_id]
    @itinerary.location = params[:location]

    save_status = @itinerary.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/itineraries/new", "/create_itinerary"
        redirect_to("/itineraries")
      else
        redirect_back(:fallback_location => "/", :notice => "Itinerary created successfully.")
      end
    else
      render("itineraries/new.html.erb")
    end
  end

  def edit
    @itinerary = Itinerary.find(params[:id])

    render("itineraries/edit.html.erb")
  end

  def update
    @itinerary = Itinerary.find(params[:id])

    @itinerary.user_id = params[:user_id]
    @itinerary.photo_id = params[:photo_id]
    @itinerary.category_id = params[:category_id]
    @itinerary.location = params[:location]

    save_status = @itinerary.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/itineraries/#{@itinerary.id}/edit", "/update_itinerary"
        redirect_to("/itineraries/#{@itinerary.id}", :notice => "Itinerary updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Itinerary updated successfully.")
      end
    else
      render("itineraries/edit.html.erb")
    end
  end

  def destroy
    @itinerary = Itinerary.find(params[:id])

    @itinerary.destroy

    if URI(request.referer).path == "/itineraries/#{@itinerary.id}"
      redirect_to("/", :notice => "Itinerary deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Itinerary deleted.")
    end
  end
end
