class CategoriesController < ApplicationController
    before_action :set_cat, only: [:show, :update, :destroy]


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
          format.json { json_response(@category) }
      else
          format.json { json_response(@category.errors, :unprocessable_entity) }
      end
  
    end
  
    def show
      json_response(@category.to_json(:include => :word))
    end
  
    def update
  
      if @category.update(cat_params)
        format.json { json_response(@category) }
      else
        format.json { json_response(@category.errors, :unprocessable_entity) }
      end
    end
  
    def destroy
      @category.destroy
      format.json { head :no_content }
      
    end
  
    private
  
    def cat_params
      params.permit(:name, :created_by)
    end
  
    def set_cat
      @category = Category.find(params[:id])
    end
end
