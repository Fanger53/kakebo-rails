class GroupsController < ApplicationController
  before_action :set_group, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /groups or /groups.json
  def index
    @group = Group.new
    @groups = current_user.groups.order('created_at DESC')
  end

  # GET /groups/1 or /groups/1.json
  def show
    @group = Group.find_by(id: params[:id])
    @transfers = Transfer.includes(:group, :user).where(group_id: @group.id).order('created_at DESC')
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit; end

  # POST /groups or /groups.json
  def create
    @group = current_user.groups.build(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to '/groups', notice: 'Group was successfully created.' }
        format.json { render :index, status: :created, location: @group }
      else
        # format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1 or /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1 or /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_group
    @group = Group.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def group_params
    params.require(:group).permit(:name, :icon, :user_id, :icon_image)
  end
end
