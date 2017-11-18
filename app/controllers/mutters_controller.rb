class MuttersController < ApplicationController
  before_action :set_mutter, only: [:edit, :update, :destroy]
  
  def index
    @mutters = Mutter.all
  end

  def new
    if params[:back]
      @mutter = Mutter.new(mutters_params)
    else
      @mutter = Mutter.new
    end
  end

  def create
    @mutter = Mutter.create(mutters_params)
    if @mutter.save
      redirect_to mutters_path, notice: "つぶやきました！"
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @mutter.update(mutters_params)
      redirect_to mutters_path, notice: "つぶやきを編集しました！"
    else
      render 'edit'
    end
  end
  
  def destroy
    @mutter.destroy
    redirect_to mutters_path, notice: "つぶやきを削除しました！"
  end
  
  def confirm
    @mutter = Mutter.new(mutters_params)
    render :new if @mutter.invalid?
  end
  
  private
    def mutters_params
      params.require(:mutter).permit(:content)
    end
    
    def set_mutter
      @mutter = Mutter.find(params[:id])
    end
    
end