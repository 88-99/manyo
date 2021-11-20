class LabelsController < ApplicationController
  before_action :set_label, only: %i[ edit update destroy ]
  def index
    @labels = Label.all
  end

  def new
    @label = Label.new
  end

  def create
    @label = Label.new(label_params)
    if @label.save
      redirect_to labels_path, notice: "ラベルを作成しました！"
    else
      render :new
    end
  end

  def edit
    @label = Label.find(params[:id])
  end

  def update
    @label = Label.find(params[:id])
    if @label.update(label_params)
      redirect_to labels_path, notice: "ラベルを編集しました！"
    else
      render :edit
    end
  end


  def destroy
    @label.destroy
      redirect_to labels_path, notice: "ラベルを削除しました！"
  end

  private
  def set_label
    @label = Label.find(params[:id])
  end

  def label_params
    params.require(:label).permit(:name, { label_ids: [] })
  end
end
