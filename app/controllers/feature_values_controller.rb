class FeatureValuesController < ApplicationController
    def index
        render json: FeatureValue.all
    end
end
