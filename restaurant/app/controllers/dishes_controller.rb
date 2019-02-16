class DishesController < ApplicationController
    def index
        @dishes = Dish.all
    end
    
    def new
        @dish = Dish.new
    end
    
    def create
        Dish.create(
            name: params[:dish][:name],
            description: params[:dish][:description],
            picture: params[:dish][:picture],
            price: params[:dish][:price]
        )
        redirect_to dishes_path
    end
    
    def edit
        @dish = Dish.find(params[:id])
    end
    
    def update
        @dish = Dish.find(params[:id])
        @dish.name = params[:dish][:name]
        @dish.description = params[:dish][:description]
        @dish.picture = params[:dish][:picture]
        @dish.price = params[:dish][:price]
        if @dish.save
            flash[:info] = "Saved successfully"
            redirect_to dishes_path
        else
            render 'edit'
        end
    end
    
    def delete
        dish = Dish.find(params[:id])
        dish
    end
end
