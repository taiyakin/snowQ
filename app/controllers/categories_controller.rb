class CategoriesController < ApplicationController
  before_action :set_category, only: [:show]

  def show
    @categories = [{genre:"初心者",path: "/categories/1"},{genre:"フリーラン",path: "/categories/2"},{genre:"カービング",path: "/categories/3"},{genre:"パウダー",path: "/categories/4"},{genre:"グラトリ",path: "/categories/5"},{genre:"ラントリ",path: "/categories/6"},{genre:"キッカー",path: "/categories/7"},{genre:"ジブ",path: "/categories/8"},{genre:"ハーフパイプ",path: "/categories/9"},{genre:"バックカントリー",path: "/categories/10"},{genre:"アルペン",path: "/categories/11"},{genre:"俺の滑り見て！",path: "/categories/12"},{genre:"ギア関連",path: "/categories/13"},{genre:"その他何でも",path: "/categories/14"},]
  end



  private
    def set_category
      @category = Category.find(params[:id])
      @questions = @category.questions.order(created_at: :desc).page(params[:page]).per(6)
    end

end
