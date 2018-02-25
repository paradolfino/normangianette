class PhrasesController < ApplicationController
    before_action :set_phrase, only: [:show, :update, :destroy]


  def index
    @phrases = Phrase.all
    json_response(@phrases)
  end

  def new
    @phrase = Phrase.new
  end

  def create
    @phrase = Phrase.new(phrase_params)
    if @phrase.save
        redirect_to phrases_path, notice: 'Word was successfully saved.'
    else
        render 'new'
    end
    json_response(@phrase, :created)
  end

  def show
    json_response(@phrase)
  end

  def update
    @phrase.update(phrase_params)
    head :no_content
  end

  def destroy
    @phrase.destroy
    head :no_content
  end

  private

  def phrase_params
    params.permit(:title, :created_by)
  end

  def set_phrase
    @phrase = Phrase.find(params[:id])
  end
end
