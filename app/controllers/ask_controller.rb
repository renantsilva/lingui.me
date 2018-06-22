class AskController < ApplicationController
  before_action :authenticate_user!
  def index
    @post = Post.new
    @learningLanguage = LearningLanguage.where(:user => current_user.id)
    @motherLanguage = MotherLanguage.where(:user => current_user.id)
  end

  def create
    params[:ask]['user_id'] = current_user.id
    params[:ask]['upvotes'] = 0

    @post = Post.new(ask_params)


    respond_to do |format|
      if @post.save
        bookmark = Bookmark.new(user_id: current_user.id, post_id: @post.id)
        bookmark.save!
          format.html { redirect_to @post, notice: t('successfully_created') }
          format.json { render :show, status: :created, location: @post }
      else
        format.html { render :index }
      end
    end
  end


  def ask_params
    params.require(:ask).permit( :difficulty, :learning_language, :mother_language, :title, :text, :upvotes, :user_id)
  end

end
