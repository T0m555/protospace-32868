class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    query = "SELECT * FROM prototypes "
    @prototypes = Prototype.find_by_sql(query)
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.create(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :create
    end
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end

  def show
    @prototype = Prototype.find(params[:id])#params内部にidが存在する！
    @comment = Comment.new #@prototype.commnets
    @comments = @prototype.comments.includes(:user)
    # binding.pry
  end

  def edit
    if current_user.id == Prototype.find(params[:id]).user_id
      @prototype = Prototype.find(params[:id])#必須 ここで取得した値を編集formに代入する。
    else
      redirect_to root_path
    end
  end

  def update
    prototype = Prototype.find(params[:id])#params内部にidが存在しない。
    # binding.pry
    #↑これが動かん。
    if prototype.update(prototype_params)
      redirect_to prototype_path(prototype.id)
    else
      @prototype = prototype
      render :edit
    end
  end

  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
    # params.permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end
end
