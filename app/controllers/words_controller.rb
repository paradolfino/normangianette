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
    respond_to do |format|
        if @word.save
            redirect_to words_path, notice: 'Word was successfully saved.'
        else
            render 'new'
        end
      end
  end

  def show
    json_response(@word)
  end

  def edit; end

  def update
    if @word.update(word_params)
        redirect_to word_path(@word), notice: 'Word was successfully updated.'
    else
        render 'edit'
    end
    
    head :no_content
  end

  def destroy
    @word.destroy
    redirect_to words_path, notice: 'Word was successfully destroyed.'
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
