class FeatureValuesController < ApplicationController
    def index
        scope = FeatureValue.all
        scope = scope.select { |feature_value| params[:ids].include?(feature_value.id.to_s) } if params[:ids]
        
        render json: scope.to_json(include: {
            limit: {
                include: { 
                    limit_values: {
                        include: [:feature, :feature_values]
                    }
                }
            }
        })
    end
end