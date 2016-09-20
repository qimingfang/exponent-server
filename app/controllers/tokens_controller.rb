require 'exponent-server-sdk'

class TokensController < ApplicationController

  def create
    message = ''

    @token = Token.where('value = ? AND user_id = ?', params[:token][:value], params[:token][:user_id]).first

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

  private

  def token_params
    params.require(:token).permit(:value, :user_id)
  end

  def exponent
    @exponent ||= Exponent::Push::Client.new
  end

end
