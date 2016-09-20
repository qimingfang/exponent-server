require 'exponent-server-sdk'

class TokensController < ApplicationController

  def create
    message = ''

    @token = Token.where('user_id = ?', params[:token][:user_id]).first

    if @token.present?
      message = 'Welcome back!'
    else
      @token = Token.create(token_params)
      message = 'Welcome to Exponent'
    end

    puts message

    exponent.publish(
      exponentPushToken: @token.value,
      message: message,
      data: {a: 'New nudge!'}
    )

    render json: {success: true}
  end

  def notify
    Token.all.each do |token|
      exponent.publish(
        exponentPushToken: token.value,
        data: {a: 'New nudge!'}
      )
    end

    render json: {success: true}
  end

  private

  def token_params
    params.require(:token).permit(:value, :user_id)
  end

  def exponent
    @exponent ||= Exponent::Push::Client.new
  end

end
