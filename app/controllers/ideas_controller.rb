class IdeasController < ApplicationController
  def index
    @ideas = Idea.all
    @q = Idea.ransack(params[:id])
  end

  def show
    @idea = Idea.find(params[:id])
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)
    if @idea.save!
      redirect_to @idea, notice: "201 Created"
    else
      render :new, notice: "422 Unprocessable Entity"
    end
  end

  def edit
  end

  private

  def idea_params
    params.require(:idea).permit(:name, :body)
  end


end
