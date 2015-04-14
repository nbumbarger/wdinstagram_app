class EntriesController < ApplicationController

  before_action :find_entry, only: [:show, :edit, :update, :destroy]

  def index
    @entries = Entry.all
  end

  def show
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)
    if @entry.save
      redirect_to @entry
    else
      render :new
    end
  end

  def edit
  end

  def update
    @entry.update(params)
    redirect_to @entry
  end

  def destroy
    @entry.destroy
    redirect_to "/entries"
  end

  private
    def entry_params
      params.require(:author).permit(:photo_url, :date_taken)
    end

    def find_entry
      @entry = Entry.find(params[:id])
    end


end
