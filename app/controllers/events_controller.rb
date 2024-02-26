class EventsController < ApplicationController

  before_action :authenticate_user!
  def index
  end

  def create_event_a
    #request data
    event_data = { 
      eventName: 'new-test-event',
      userId: current_user.id,
      email: current_user.email
    }
    iterable_service = ServiceGateway.new("event_track",event_data)
    response = iterable_service.make_api_call
    
    if response.is_a?(Net::HTTPSuccess)
      flash[:success] = 'Event created successfully'
    else
      flash[:error] = "Failed to create event: #{response.body}"
    end

    # in case you wanna do it with rails gem
    # events = Iterable::Events.new
    # res = events.track 'new-test-event',current_user.email #to get all the events for current_user email
    # if res.success?
    #   flash[:success] = "Event A created successfully!"
    # else
    #   flash[:error] = "Error creating Event A: #{res.error_message}"
    # end
    redirect_to root_path
  end

  def create_event_b
        #request data
    request_data = {
      recipientEmail: current_user.email,
      recipientUserId: current_user.id,
      dataFields: {},
      sendAt: 1.hours.after,
      metadata: {}
    }
    
    iterable_service = ServiceGateway.new("email_target", request_data)
    response = iterable_service.make_api_call

    if response.is_a?(Net::HTTPSuccess)
      flash[:success] = "Email sent successfully to #{current_user.email}!"
    else
      flash[:error] = "Failed to sent email #{response.body}"
    end
    redirect_to root_path
  end

  private



end
