class CategoriesController < ApplicationController
    before_action :set_cat, only: [:show, :update, :destroy]


    def index
      @categories = Category.all
      respond_to do |format|
        format.html { render :index }
        format.json { json_response(@categories.to_json(:include => [:words, :phrases])) }
      end
    end
  
    def new
      @category = Category.new
    end
  
    def create
      @category= Category.new(cat_params)
  
      if @category.save
          format.json { json_response(@category.to_json(:include => [:words, :phrases])) }
      else
          format.json { json_response(@category.errors, :unprocessable_entity) }
      end
  
    end
  
    def show
      respond_to do |format|
        format.html { render :show}
        format.json { json_response(@category.to_json(:include => [:words, :phrases])) }
      end
    end
  
    def update
  
      if @category.update(cat_params)
        format.json { json_response(@category.to_json(:include => [:words, :phrases])) }
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
