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

  def destroy
    hash_tag_param = params.permit(:id)
    hash_tag = HashTag.find_by(hash_tag_param)
    unless hash_tag.nil?
      hash_tag.destroy
    end
    redirect_to hash_tags_path
  end
end
