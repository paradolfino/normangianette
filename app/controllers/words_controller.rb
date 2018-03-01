class WordsController < ApplicationController
    before_action :set_word, only: [:show, :update, :destroy]


  def index

    @words = Word.all
    respond_to do |format|
      format.html { render :index}
      format.json { json_response(@words.to_json(:include => :phrases)) }
    end
    
  end

  def new
    @word = Word.new
  end

  def create
    @word = Word.new(word_params)

    if @word.save
        puts "success"
    else
      puts "fail"
        format.json { json_response(@word.errors, :unprocessable_entity) }
        #render json: @word.errors, status: :unprocessable_entity
    end

  end

def show
    respond_to do |format|
      format.html { render :show}
      format.json { json_response(@word.to_json(:include => :phrases)) }
    end
end

  def edit; end

  def update

    if @word.update(word_params)
      format.json { json_response(@word.to_json(:include => :phrases)) }
    else
      format.json { json_response(@word.errors, :unprocessable_entity) }
    end

  end

  def destroy
    @word.destroy

    format.json { head :no_content }

  end

  private

  def word_params
    params.permit(:eng_si, :nor_si, :nor_pl, :nor_def, :nor_defpl, :nor_past, :nor_pres, :nor_fut, :created_by)
  end

  def set_word
    @word = Word.find(params[:id])
  end
end
