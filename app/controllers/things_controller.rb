class ThingsController < ApplicationController
  respond_to :json
  after_filter :get_action, :only => [:update]
  
  def get_action #adopted or abandoned and relevent emails
    @user=current_user
    if @thing.user_id.blank?
      ThingMailer.abandoned_alert(@thing, @user).deliver
    else
      ThingMailer.adopted(@thing).deliver
      ThingMailer.adopted_alert(@thing).deliver
    end
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
    if @thing.update_attributes(thing_params)
      respond_with @thing
    else
      render(json: {errors: @thing.errors}, status: 500)
    end
  end

  private

  def thing_params
    params.require(:thing).permit(:name, :user_id, :city_id, :lng, :lat, :tos )
  end
end
