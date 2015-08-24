module GoalsHelper
  def all_public_goals
    Goal.where(status: "Public")
  end
end
