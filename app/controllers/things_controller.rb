class ThingsController < ApplicationController
  respond_to :json
  after_filter :get_action, :only => [:update]
  
  def get_action
    puts 'got here'
  end
  def show
    @things = Thing.find_closest(params[:lat], params[:lng], params[:limit] || 10)
    unless @things.blank?
      respond_with @things
    else
      render(json: {errors: {address: [t("errors.not_found", thing: t("defaults.thing"))]}}, status: 404)
    end
  end

  def update
    @thing = Thing.find(params[:id])  
    if @thing.update_attributes(params[:thing])#(thing_params)
      respond_with @thing
    else
      render(json: {errors: @thing.errors}, status: 500)
    end
  end

  private

  def thing_params
    params.require(:thing).permit(:name, :user_id, :city_id, :lng, :lat, :eula )
  end
end
