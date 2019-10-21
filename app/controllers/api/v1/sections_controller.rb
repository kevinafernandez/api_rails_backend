class Api::V1::SectionsController < ApplicationController
  before_action :set_section, only: [:show]

  # GET /sections
  def index
    @sections = Section.all
    render json: serializer.new(@sections)
  end

  # GET /sections/1
  def show
    render json: serializer.new(@section)
  end

  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_section
      @section = Section.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def section_params
      params.require(:section).permit(:name, :description)
    end

    def serializer
      SectionSerializer
    end
end

