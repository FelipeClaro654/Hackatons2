class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.all
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
  end

  # GET /teams/new
  def new
    @team = Team.new
    @integrantes = @team.integrantes.new
  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(team_params)
    if simple_captcha_valid?
      respond_to do |format|
        if @team.save
          @team.integrantes.each do |integrante|
            TeamMailer.confirm(integrante).deliver
          end
          format.html { redirect_to @team, notice: 'Time cadastrado com sucesso.' }
          format.json { render :show, status: :created, location: @team }
        else
          format.html { render :new, notice: 'Erro ao cadastrar novo time.' }
          format.json { render json: @team.errors, status: :unprocessable_entity }
        end
      end
    else
      @team.errors.add(:captcha, 'Captcha incorreto')
      respond_to do |format|
        format.html { render :new, notice: 'Erro ao cadastrar novo time.' }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    if simple_captcha_valid?
      respond_to do |format|
        if @team.update(team_params)
          @team.update_attribute(:tipo_id, params[:team][:tipo_id])
          format.html { render :show, notice: 'Time cadastrado com sucesso.' }
          format.json { render :show, status: :ok, location: @team }
        else
          format.html { render :edit, notice: 'Erro ao cadastrar novo time.' }
          format.json { render json: @team.errors, status: :unprocessable_entity }
        end
      end
    else
      @team.errors.add(:captcha, 'Captcha incorreto')
      respond_to do |format|
        format.html { render :edit, notice: 'Captcha incorreto.' }
        format.json { render json: @team, status: :unprocessable_entity }
      end
    end

  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: 'Team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:name, :description, :tipo_id, :captcha, :captcha_key, integrantes_attributes:[:id, :nome, :cpf, :email, :obs, :_destroy])
    end

end
