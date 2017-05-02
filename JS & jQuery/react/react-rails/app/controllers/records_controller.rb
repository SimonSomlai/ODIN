class RecordsController < ApplicationController
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

  def index
    @records = Record.all.order("date DESC")
  end

  def create
    @record = Record.new(record_params)
    if @record.save
      render json: @record
    else
     render json: @record.errors, status: :unprocessable_entity
    end
  end

  def update
    @record = Record.find_by(id: params[:id])
    if @record.update_attributes(record_params)
      render json: @record
    else
      flash[:notice] = "Record not found"
    end
  end

  def find_record
    @record = Record.where(record_params).first
    if @record
      render json: @record
    else
      render json: @record.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @record = Record.find_by(id: params[:id])
    if @record
      render json: @record.destroy
    else
      flash[:notice] = "Record not found"
    end
  end

  private

  def record_params
    params.require(:record).permit(:amount, :date, :title)
  end
end
