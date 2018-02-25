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
            
            format.html { redirect_to @word, notice: 'Word was successfully saved.' }
            format.json { render :show, status: :created, location: @word }
        else
            format.html { render :new }
            format.json { render json: @word.errors, status: :unprocessable_entity }
        end
      end
  end

  def show; end

  def edit; end

  def update
    respond_to do |format|
        if @word.update(word_params)
          format.html { redirect_to @word, notice: 'Word was successfully updated.' }
          format.json { render :show, status: :ok, location: @word }
        else
          format.html { render :edit }
          format.json { render json: @word.errors, status: :unprocessable_entity }
        end
      end
  end

  def destroy
    @word.destroy
    respond_to do |format|
        format.html { redirect_to words_path, notice: 'Word was successfully destroyed.' }
        format.json { head :no_content }
    end
  end

  private

  def word_params
    params.permit(:eng_si, :nor_si, :nor_pl, :nor_def, :nor_defpl, :nor_past, :nor_pres, :nor_fut, :created_by)
  end

  def set_word
    @word = Word.find(params[:id])
  end
end
