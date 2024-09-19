class FeaturesController < ApplicationController
    def index
        render json: Feature.all.to_json(include: :feature_values)
    end
end