class GoalsController < ApplicationController
  def index
    #all public goals
  end

  def show
    #all user's goals
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])
    if @goal.update(goal_params)
      redirect_to goal_url(@goal)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :show
    end
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = current_user.goals.new(goal_params)
    if @goal.save
      redirect_to goal_url(@goal)
    else
      @errors = @goal.errors.full_messages
      render :new
    end
  end

  def destroy
    @goal = Goal.destroy(params[:id])
    redirect_to user_url(@goal.user)
  end

  private

  def goal_params
    params.require(:goal).permit(:body, :status, :completed)
  end
end
