class Monologue::TagsController < Monologue::ApplicationController
  def show
    tag_str = params[:tag]
    get_posts_with_tag(tag_str)
  end

  def news
    tag_str = 'news'
    get_posts_with_tag(tag_str)
  end

  def articles
    tag_str = 'articles'
    get_posts_with_tag(tag_str)
  end

  private
  def get_posts_with_tag(tag_str)
    @tag = Monologue::Tag.where("lower(name) = ?", tag_str.mb_chars.to_s.downcase).first
    if @tag
      @page = nil
      @posts = @tag.posts_with_tag
      render :show
    else
      redirect_to :root ,notice: "No post found with label \"#{tag_str}\""
    end
  end

  def retrieve_tag(tag)
    Monologue::Tag.where("lower(name) = ?", tag.mb_chars.to_s.downcase).first
  end
end
