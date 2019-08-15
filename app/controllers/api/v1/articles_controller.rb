module Api::V1
  class ArticlesController < ApplicationController
    before_action :set_section, only: [:show, :update, :destroy]
  
    # GET /articles
    def index
      @articles = Article.all
  
      render json: serializer.new(@articles)
    end
  
    # GET /articles/1
    def show
      render json: serializer.new(@article)
    end
  
    # POST /articles
    def create
      @article = Article.new(section_params)
  
      if @article.save
        render json: serializer.new(@article), status: :created
      else
        render json: serializer.new(@article.errors), status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /articles/1
    def update
      if @article.update(section_params)
        render json: serializer.new(@article) 
      else
        render json: serializer.new(@article.errors), status: :unprocessable_entity
      end
    end
  
    # DELETE /articles/1
    def destroy
      @article.destroy
      head :no_content 
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_section
        @article = Article.find(params[:id])
      end
  
      # Only allow a trusted parameter "white list" through.
      def section_params
        params.require(:section).permit(:name, :description, :sections_attributes => [:id, :name])
      end

      def serializer
        ArticleSerializer
      end

  end
end 
