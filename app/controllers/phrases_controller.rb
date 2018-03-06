class PhrasesController < ApplicationController
    before_action :set_phrase, only: [:show, :update, :destroy]


  def index
    @phrases = Phrase.all
    respond_to do |format|
      format.html { render :index }
      format.json { json_response(@phrases) }
    end
  end

  def new
    @phrase = Phrase.new
  end

  def create
    @phrase = Phrase.new(phrase_params)

    if @phrase.save
      json_response(@phrase)
    else
      json_response(@phrase.errors, :unprocessable_entity)
    end

  end

  def show
    json_response(@phrase.to_json(:include => :word))
  end

  def update

    if @phrase.update(phrase_params)
      json_response(@phrase)
    else
      json_response(@phrase.errors, :unprocessable_entity)
    end
  end

  def destroy
    @phrase.destroy
    head :no_content
    
  end

  private

  def phrase_params
    params.permit(:english, :normansk, :word_id, :category_id)
  end

  def set_phrase
    @phrase = Phrase.find(params[:id])
  end
end
