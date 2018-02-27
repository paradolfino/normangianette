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

    respond_to do |format|
        if @phrase.save
            
            format.html { redirect_to @phrase, notice: 'Phrase was successfully saved.' }
            format.json { json_response(@phrase) }
        else
            format.html { render :new }
            format.json { json_response(@phrase.errors, :unprocessable_entity) }
        end
      end
  end

  def show; end

  def update
    respond_to do |format|
        if @phrase.update(phrase_params)
          format.html { redirect_to @phrase, notice: 'Phrase was successfully updated.' }
          format.json { json_response(@phrase) }
        else
          format.html { render :edit }
          format.json { json_response(@phrase.errors, :unprocessable_entity) }
        end
    end
  end

  def destroy
    @phrase.destroy
    respond_to do |format|
        format.html { redirect_to phrases_path, notice: 'Phrase was successfully destroyed.' }
        format.json { head :no_content }
    end
  end

  private

  def phrase_params
    params.permit(:english, :normansk, :created_by)
  end

  def set_phrase
    @phrase = Phrase.find(params[:id])
  end
end
