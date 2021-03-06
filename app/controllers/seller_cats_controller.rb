# -*- encoding : utf-8 -*-
class SellerCatsController < ApplicationController
  layout 'management'

  def index
    @seller_cats = current_user.seller_cats.parent_cats.include_sub_seller_cats.taobao_order
  end

  def update_priorities
    SellerCat.update_priorities(params[:priorities], current_user) if params[:priorities].is_a?(Hash)
    flash.notice = "更新成功"
    redirect_to action: :index
  end
end
