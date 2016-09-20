require 'exponent-server-sdk'

class TokensController < ApplicationController

  def create
    message = ''

    @token = Token.where('user_id = ?', params[:token][:user_id]).first

    if !@token.present?
      @token = Token.create(token_params)
      exponent.publish(
        exponentPushToken: @token.value,
        message: 'Welcome!',
        data: {a: 'Welcome!'}
      )
    end

    render json: {success: true}
  end

  def notify
    Token.all.each do |token|
      exponent.publish(
        exponentPushToken: token.value,
        message: 'New nudge!!',
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
