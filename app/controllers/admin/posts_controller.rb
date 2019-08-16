class PostsController < Admin::AdminsController 
  before_action :set_admin_post, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  def index
    @admin_posts = Post.all
  end

  def show
  end

  def new
    @admin_post = Post.new
  end

  def edit
  end

  def create
    @admin_post = Post.new(admin_post_params)

    respond_to do |format|
      if @admin_post.save
        format.html { redirect_to @admin_post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @admin_post }
      else
        format.html { render :new }
        format.json { render json: @admin_post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @admin_post.update(admin_post_params)
        format.html { redirect_to @admin_post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_post }
      else
        format.html { render :edit }
        format.json { render json: @admin_post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @admin_post.destroy
    respond_to do |format|
      format.html { redirect_to admin_posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_admin_post
    @admin_post = Post.find(params[:id])
  end

  def admin_post_params
    params.require(:admin_post).permit(:title, :content, :summary)
  end
end
