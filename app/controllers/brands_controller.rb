class BrandsController < ApplicationController
    def index
        render json: Brand.all.to_json(include: {
            features: {
                include: :feature_values
            }
        })
    end

    def show
        render json: Brand.find(params[:id]).to_json(
            include: {
                features: {
                    include: :feature_values
                }
            }
        )
    end
end