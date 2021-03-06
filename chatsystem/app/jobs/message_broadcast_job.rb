class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast 'room_channel', message: render_message(message) # ブロードキャストの実行。
  end
  
  private
    def render_message(message)
      ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
      # Rails5 のポイント。コントローラの外でビューのレンダリングを実現。
      # messages/message のパーシャルビューの HTML を message に返す。
    end
end
