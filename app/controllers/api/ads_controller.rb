class Api::AdsController < ApplicationController
  before_action :authencate_user!
  before_action :set_ad, only: [:show, :update, :destroy, :view]

  # GET /ads
  # GET /ads.json
  def index
    render json: @ads = Ad.all
  end

  # GET /ads/1
  # GET /ads/1.json
  def show
    render json: @ad
  end

  # POST /ads
  # POST /ads.json
  def create
    if current_user.wallet.points >= 125
      @ad = Ad.new(ad_params)
      @ad.user =current_user
      if @ad.save
        current_user.wallet.points -= 125
        render json: {ad: @ad, content: url_for(@ad.content)}, status: :created
      else
        render json: @ad.errors, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /ads/1
  # PATCH/PUT /ads/1.json
  def update
    if @ad.update(ad_params)
      render :show, status: :ok, location: @ad
    else
      render json: @ad.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ads/1
  # DELETE /ads/1.json
  def destroy
    @ad.destroy
  end

  

  def view
    if (Validation.find_by(ad: @ad, user: current_user).watched) == true
      current_user.wallet.increment!(:points,0.0016)
      head 200
    else
      render json: {error_msg: "Ad not watched"}, status: :unprocessable_entity
    end
  end
    

  def follow
    @follow = Follow.new(user: current_user, followed_user: User.find(params[:followed_user_id])) 
    @follow.save
    head 200
  end

  def request
    share_request = ShareRequest.new(
      sender: current_user,
      reciever: User.find(params[:user_id]),
      ad: Ad.find(params[:ad_id])
      status: "Pending"
    )
    if share_request.save
      head 200
    else
      render json: share_request.errors, status: :unprocessable_entity
    end
        
  end

  def view_request
    begin
      requests = ShareRequest.find_by(reciever: current_user)
      render json: requests, status: :ok
    rescue
      render json: {error_msg: "No Requests"}, status: :unprocessable_entity
    end
  end


  def accept
    begin
      request = ShareRequest.find_by(
        sender: current_user,
        reciever: User.find(params[:user_id]),
        ad: Ad.find(params[:ad_id])
      )
      request.status = "Accepted"
      share(user: current_user, ad: request.ad)
      head 200
    rescue
      render json: {error_msg: "somthing went wrong"}, status: :unprocessable_entity
    end
  end
  
  def reject
    begin
      request = ShareRequest.find_by(
        sender: current_user,
        reciever: User.find(params[:user_id]),
        ad: Ad.find(params[:ad_id])
      )
      request.status = "Rejected"
      head 200
    rescue
      render json: {error_msg: "somthing went wrong"}, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ad
      @ad = Ad.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ad_params
      params.permit(:caption, :content)
    end

    def share(user, ad)
      share_ad = SharedAd.new(user, ad))
      user.wallet.increment!(:points,3.125)
      share_ad.save
      user.save
    end
end
