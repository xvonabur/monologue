class Monologue::TagsController < Monologue::ApplicationController
  def show
    @tag = retrieve_tag
    if @tag
      @page = nil
      @posts = @tag.posts_with_tag
    else
      redirect_to :root ,notice: "No post found with label \"#{params[:tag]}\""
    end
  end

  def news
    tag_str = 'news'
    @tag = Monologue::Tag.where("lower(name) = ?", tag_str.mb_chars.to_s.downcase).first
    if @tag
      @page = nil
      @posts = @tag.posts_with_tag
      render :show
    else
      redirect_to :root ,notice: "No post found with label \"#{tag_str}\""
    end
  end

  def blog
    tag_str = 'blog'
    @tag = Monologue::Tag.where("lower(name) = ?", tag_str.mb_chars.to_s.downcase).first
    if @tag
      @page = nil
      @posts = @tag.posts_with_tag
      render :show
    else
      redirect_to :root ,notice: "No post found with label \"#{tag_str}\""
    end
  end

  private
  def retrieve_tag
    Monologue::Tag.where("lower(name) = ?", params[:tag].mb_chars.downcase.to_s).first
  end
end
