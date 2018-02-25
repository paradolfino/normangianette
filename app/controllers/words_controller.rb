class WordsController < ApplicationController
    before_action :set_word, only: [:show, :update, :destroy]


  def index
    @words = Word.all
    json_response(@words)
  end

  def new
    @word = Word.new
  end

  def create
    @word = Word.new(word_params)
    json_response(@word, :created)
    if @word.save
        puts @portfolio
        redirect_to words_path, notice: 'Word was successfully saved.'
    else
        render 'new'
    end
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
    params.permit(:eng_si, :nor_si, :nor_pl, :nor_def, :nor_defpl, :nor_past, :nor_pres, :nor_fut, :created_by)
  end

  def set_word
    @word = Word.find(params[:id])
  end
end
