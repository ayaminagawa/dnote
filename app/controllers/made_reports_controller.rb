class MadeReportsController < ApplicationController
  def new
    @made_report = MadeReport.new
    @recipe = Recipe.find(params[:recipe_id])
    render :layout => "preview_layout"
  end

  def create
  	@made_report = current_user.made_reports.build(made_report_params)
    @recipe = Recipe.find(params[:recipe_id])
    # @recipe = current_user.recipes.build(recipe_params)
    # @made_report = current_user.made_reports.build(commit_params)


    # respond_to do |format|
    #   if @made_report.save
    #     format.html { redirect_to @made_report, notice: 'made_report was successfully created.' }
    #     format.json { render action: 'show', status: :created, location: @made_report }
    #   else
    #     format.html { render action: 'new' }
    #     format.json { render json: @made_report.errors, status: :unprocessable_entity }
    #   end
    # end

    # redirect_to(recipe_path(recipe_id))

    if @made_report.save
      redirect_to(recipe_path(@recipe))
    else
      render 'new'
    end
    render :layout => "preview_layout"
  end

  def update
   render :layout => "preview_layout"
 end

 def edit
  render :layout => "preview_layout" 
end

def destroy
 @made_report.destroy
 respond_to do |format|
  format.html { redirect_to made_reports_url }
  format.json { head :no_content }
end
end

def show
end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_made_report
      @made_report = MadeReport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def made_report_params
      params.require(:made_report).permit(:message, :image, :recipe_id)
    end

  end
