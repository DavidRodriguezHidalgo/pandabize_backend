class BrandsController < ApplicationController
    def index
        render json: Brand.all.to_json(include: {
            features: {
                include: :feature_values
            }
        })
    end
end
