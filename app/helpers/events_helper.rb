module EventsHelper
  def current_participation
  	@current_participation ||= current_user && @event.participations.where(user_id: current_user.id).first
  end	 
end
