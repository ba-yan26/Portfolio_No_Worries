class Public::NotificationsController < ApplicationController
  def index
    @notifications = current_end_user.passive_notifications
    # ログインしているユーザーに受け取った通知を全て取得する
    @notifications.where(checked: false).each do |notification|
    # checkedがfalse(未読)のものを一つずつ取り出して
      notification.update(checked: true)
      # true(既読)にする
    end
  end
end
