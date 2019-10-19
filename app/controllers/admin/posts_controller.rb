class Admin::PostsController < Admin::AdminsController 
  before_action :set_admin_post, only: [:show, :edit, :update, :destroy]
  authorize_resource 

  def index
    @title = "List Posts"
    @admin_posts = Post.search_by_status(params[:status])
    @admin_posts_stats = Post.get_stats
  end

  def show
  end

  def new
    @title = "New Post"
    @admin_post = Post.new
  end

  def edit
    @title = "Edit Post"
    gon.post_tags = @admin_post.tags.map { |tag| Hash[value: tag.id, label: tag.name]}
    gon.post_categories = @admin_post.categories.map { |category| Hash[value: category.id, label: category.name]}
  end

  def create
    @title = "New Post"
    @admin_post = Post.new(admin_post_params)
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
          format.html { redirect_to previews_post_url(@admin_post.permalink) }
          format.json { render :show, status: :ok, location: @admin_post }
          format.js
        else
          format.html { render :new }
          format.json { render json: @admin_post.errors, status: :unprocessable_entity }
          format.js
        end
      elsif params[:commit]
        if @admin_post.update(admin_post_params)
          format.html { redirect_to admin_posts_path, notice: 'Post was successfully updated.' }
          format.json { render :show, status: :ok, location: @admin_post }
          format.js
        end
      elsif params[:save_draft]

      elsif params[:publish]

      else
        format.html { render :edit }
        format.json { render json: @admin_post.errors, status: :unprocessable_entity }
        format.js
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
    params[:post][:category_ids] = params[:post][:category_ids][0].split(/[\s,]+/) unless params[:post][:category_ids].nil? || params[:post][:category_ids].empty? 
    params[:post][:tag_ids] = params[:post][:tag_ids][0].split(/[\s,]+/) unless params[:post][:tag_ids].nil? || params[:post][:tag_ids].empty?
    params.require(:post).permit(:created_at, :title, :content, :summary, :permalink, :status, category_ids: [], tag_ids: [])
  end
end
