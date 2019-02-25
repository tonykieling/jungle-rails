class ReviewsController < ApplicationController

  before_action :require_login  


  def create

    # check if user is logged, otherwise send them to login page
    if current_user

      # create the review and save it
      product = Product.find_by_id(params[:product_id])
      new_review = Review.new(
        product: product,
        user: current_user,
        description: review_params[:description],
        rating: review_params[:rating]
      )
  
      if new_review.save
        redirect_to product_path(id: params[:product_id])
      else
        puts new_review.errors.full_messages
        redirect_to '/', notice: 'Your Review has not been saved. Please, try again.'
      end

    else
      redirect_to '/login', notice: 'Your Review has not been saved. Please, try again.'
    end
  end

  def destroy
    # byebug
    @review = Review.find(params[:id])
    @review.destroy

    redirect_to product_path(id: params[:product_id]), notice: "Delete success"
  end


  private

  def review_params
    params.require(:review).permit(
      :description,
      :rating
    )
  end


  def require_login
    # unless logged_in?
    unless current_user
      byebug
      redirect_to '/login', notice: 'Login first, please'
    end
  end


end