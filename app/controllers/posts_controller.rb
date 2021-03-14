class PostsController < ApplicationController
  def index
    @posts = Post.all.order(id: "DESC")
  end

  def create
    post = Post.create(content: params[:content], checked: false)
    render json:{ post: post }
  end

  def checked
    post = Post.find(params[:id])
    if post.checked # if post.checked == true の略 もし既読であれば
      post.update(checked: false) # 既読であれば既読を解除して更新
    else
      post.update(checked: true)
    end

    item = Post.find(params[:id]) # 最後に更新したレコードを取得し直しitemへ代入
    render json: { post: item } #JSON形式でpost:itemを出力
  end
end