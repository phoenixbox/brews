class TeamGameUser

  attr_reader :team

  def initialize(team_id)
    @team = Team.find(team_id)
  end

  def title
    "Team name"
  end

  def display_name
    team.title
  end

  def title_2
    "Points"
  end

  def info_2
    team.points
  end

end
