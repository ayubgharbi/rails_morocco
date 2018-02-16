class ParticipationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event
  before_action :set_participation, only: :destroy

  def create
  	@participation = @event.participations.build
  	@participation.user_id = current_user.id

  	if @participation.save
  	  redirect_to @event, notice: 'Participation was successfully created.'
  	else
  	  redirect_to @event
  	end
  end

  def destroy
  	@participation.destroy
  	redirect_to @event
  end

  private

  def set_event
  	@event = Event.find(params[:event_id])
  end

  def set_participation
  	@participation = @event.participations.find(params[:id])
  end
end
