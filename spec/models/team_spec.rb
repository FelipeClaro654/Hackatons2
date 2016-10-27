RSpec.describe Team, type: :model do
  context "Validade de um Team" do
    it "Team é válido?" do
      team = Team.new
      team.name = "TeamTeste"
      team.description = "TesteDescricao"
      team.tipo_id = 1

      expect(team.valid?).to be_truthy
    end
  end
end
