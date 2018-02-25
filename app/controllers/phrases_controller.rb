class PhrasesController < ApplicationController
    before_action :set_phrase, only: [:show, :update, :destroy]


  def index
    @phrases = Phrase.all
    json_response(@phrases)
  end

  def create
    @phrase = Phrase.create!(phrase_params)
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
    @phrase = phrase.find(params[:id])
  end
end
