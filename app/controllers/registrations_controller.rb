class RegistrationsController < Devise::RegistrationsController
    respond_to :json
  def create
      @user = User.new(sign_up_params)
      wallet = Wallet.new(user: @user, points: 500)
      case params[:role]
      when "promoter"
        @user.add_role :promoter
      when "creator"
        @user.add_role :creator
      else
        @user.add_role :normal
      end
      
      if @user.save and wallet.save
        render json: @user
      else
        render json: { errors: @user.errors }
      end
    end
  private
  def sign_up_params
      
      params.permit(:email, :password, :password_confirmation)
    end
  end