# PostsController は /posts から始まるURLを処理する
class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  # GET /posts もしくは GET /posts.json のリクエストが発生した時の処理
  def index
    @posts = Post.all
  end

  # GET /posts/:id もしくは GET /posts/:id.json のリクエストが発生した時の処理
  def show; end

  # GET /posts/new のリクエストが発生した時の処理
  def new
    @post = Post.new
  end

  # GET /posts/:id/edit のリクエストが発生した時の処理
  def edit; end

  # POST /posts もしくは POST /posts.json のリクエストが発生した時の処理
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: t('.success') }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/:id もしくは PATCH /posts/:id.json のリクエストが発生した時の処理
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: t('.success') }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/:id もしくは /posts/:id.json のリクエストが発生した時の処理
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: t('.success') }
      format.json { head :no_content }
    end
  end

  private

  # URL内に:idが含まれている場合、それをキーにしてPostを検索し、@post に格納する
  # @return [Post] :idを主キーとするPostのインスタンス
  def set_post
    @post = Post.find(params[:id])
  end

  # 外部から与えられたリクエストパラメータのうち、許可するもののリストを定義する
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
