class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def new
    @blog = Blog.new
    # Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する。
  end
  
  def create
    blog = Blog.new(blog_params)
    blog.save
    redirect_to blog_path(blog.id)
  end
  
  def edit
    @blog = Blog.find(params[:id])
  end
  # newの場合インスタンスが空、editの場合すでにデータが入っている。それを判断するためにcontrollerを書き、createアクションかupdateアクションに処理を引き継いでくれる
  
  def update
    blog = Blog.find(params[:id])
    blog.update(blog_params)
    redirect_to blog_path(blog)
  end
  
  def destroy
    blog = Blog.find(params[:id])
    blog.destroy
    redirect_to blogs_path
  end
  
  private
  def blog_params
    params.require(:blog).permit(:title, :category, :body)
    # params.require(:モデル名).permit(:カラム名1, :カラム名2, ...)
  end
end
