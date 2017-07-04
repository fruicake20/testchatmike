class MessagesController < ApplicationController
  def index

    if session[:username] != nil

    @messages = Message.all

        else

      redirect_to(:action => 'login')

    end

  end

  def create
    
  	hello = params[:message]
    hello[:content] =  session[:username]+': '+hello[:content]

    @message = Message.create!(hello)
    PrivatePub.publish_to("/messages/new", message: @message)


  end

  def login

  end


  def create_username


     if !params[:username].blank?

       redirect_to(:action => 'index')
       session[:username] = params[:username]


     end

  end


end
