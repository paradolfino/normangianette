class WordsController < ApplicationController
    before_action :set_word, only: [:show, :update, :destroy]


  def index
    @words = word.all
    json_response(@words)
  end

  def create
    @word = word.create!(word_params)
    json_response(@word, :created)
  end

  def show
    json_response(@word)
  end

  def update
    @word.update(word_params)
    head :no_content
  end

  def destroy
    @word.destroy
    head :no_content
  end

  private

  def word_params
    params.permit(:title, :created_by)
  end

  def set_word
    @word = word.find(params[:id])
  end
end
