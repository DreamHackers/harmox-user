class Bot::HashTagsController < ApplicationController
  def new
    @hash_tag = HashTag.new
  end

  def create
    attr = params.require(:hash_tag).permit(:hash_tag)

    if HashTag.find_by_hash_tag(attr[:hash_tag]).nil?
      HashTag.create(attr)
      redirect_to hash_tags_path
    else
      redirect_to(new_hash_tag_path, alert: "すでに登録されているHashTagです")
    end
  end
end
