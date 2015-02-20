class MadeReportController < ApplicationController
  def new
  	 @made_report = MadeReport.new
  end

  def create
  	@made_report = MadeReport.new(made_report_params)


    # respond_to do |format|
    #   if @made_report.save
    #     format.html { redirect_to @made_report, notice: 'made_report was successfully created.' }
    #     format.json { render action: 'show', status: :created, location: @made_report }
    #   else
    #     format.html { render action: 'new' }
    #     format.json { render json: @made_report.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def destroy
  	@made_report.destroy
    respond_to do |format|
      format.html { redirect_to made_reports_url }
      format.json { head :no_content }
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
      params.require(:made_report).permit(:massage, :image)
    end
  end
end
