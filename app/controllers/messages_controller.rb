class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def create
  	hello = params[:message]
    hello[:content] =  session[:username]+': '+hello[:content]

    @message = Message.create!(hello)
    PrivatePub.publish_to("/messages/new", message: @message)
  end

  def login
	 session[:username] = params[:username]
	# redirect_to(:action => 'index')
  end

end
