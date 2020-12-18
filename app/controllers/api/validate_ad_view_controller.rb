class Api::ValidationsController < ApplicationController
    @validate_mid=false
    @validate_start=false
    @validate_end=false

    #/api/ads/validate/start
    def start
        @validate_start = true
    end

    #/api/ads/validate/mid
    def mid
        @validate_mid = true
    end

    #/api/ads/validate/end
    def end
        @validate_end = true
    end

    def validation?
        if(@validate_start and validate_mid and validate_end)
            true
        else 
            false
        end
    end
end