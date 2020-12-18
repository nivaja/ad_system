class Api::ValidationsController < ApplicationController
       
        #/api/validate/start
        def start
            @s = Validation.new(user: current_user, ad: Ad.find(params[:ad_id]))
            @s.start=true
            if @s.save

               head 200
            else
                render json: @s.errors, status: :unprocessable_entity
              end
        end
    
        #/api/validate/mid
        def mid
            ad=Ad.find(params[:ad_id])
            @m = Validation.find_by(user: current_user, ad: ad)
            @m.mid =true
            if @m.save
                head 200
             else
                 render json: @m.errors, status: :unprocessable_entity
               end
            
        end
    
        #/api/validate/end
        def end
            ad=Ad.find(params[:ad_id])
            @e = Validation.find_by(user: current_user, ad: ad)
            @e.end =true
            if validation?(@e)
                @e.watched =true
            end
            if @e.save
                head 200
             else
                 render json: @e.errors, status: :unprocessable_entity
            end           
        end
    
        private
        def validation?(validation)
            if(validation.start and validation.mid and validation.end)
                true
            else 
                false
            end
        end
end
