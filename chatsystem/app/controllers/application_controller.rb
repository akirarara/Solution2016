class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper # コントローラー全体からSessionsHelperを参照する。
end
