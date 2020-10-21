class PagesController < ApplicationController
  # ログイン後showページに遷移する
  before_action :sign_in_required, only: [:show]

  def index
  end

  def show
  end
end
