class Admin::PostsController < Admin::AdminsController 
  before_action :set_admin_post, only: [:show, :edit, :update, :destroy]
  authorize_resource 

  def index
    @title = "List Posts"
    @admin_posts = Post.search_by_status(params[:status])
    @admin_posts_quantity = Post.get_stats
  end

  def show
  end

  def new
    @title = "New Post"
    @admin_post = Post.new
  end

  def edit
    @title = "Edit Post"
  end

  def create
    @title = "New Post"
    @admin_post = Post.new(admin_post_params)
    # @admin_post.category_ids = admin_post_params[:category_ids][0].split(',').to_a
    respond_to do |format|
      if @admin_post.save
        format.html { redirect_to admin_posts_path, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @admin_post }
      else
        format.html { render :new }
        format.json { render json: @admin_post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if params[:preview_button] 
        if @admin_post.update(admin_post_params)
    # @admin_post.category_ids = admin_post_params[:category_ids][0].split(',').to_a
          format.html { redirect_to previews_post_url(@admin_post.permalink) }
        else
          format.html { render :new }
        end
      elsif params[:commit]
        if @admin_post.update(admin_post_params)
    # @admin_post.category_ids = admin_post_params[:category_ids][0].split(',').to_a
          format.html { redirect_to admin_posts_path, notice: 'Post was successfully updated.' }
          format.json { render :show, status: :ok, location: @admin_post }
        else
          format.html { render :edit }
          format.json { render json: @admin_post.errors, status: :unprocessable_entity }
        end
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
    @admin_post = Post.find_by_permalink!(params[:id])
  end

  def admin_post_params
     params[:post][:category_ids] = params[:post][:category_ids][0].split(',') 
    params.require(:post).permit(:title, :content, :summary, :permalink, :status, category_ids: [] )
  end
end
