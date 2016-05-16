require "administrate/base_dashboard"

class VideoDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    users: Field::HasMany,
    id: Field::Number,
    title: Field::String,
    summary: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    published_at: Field::DateTime,
    thumbnail_url: Field::String,
    channel_id: Field::String,
    channel_title: Field::String,
    category_id: Field::Number,
    category_title: Field::String,
    view_count: Field::Number,
    like_count: Field::Number,
    dislike_count: Field::Number,
    favorite_count: Field::Number,
    comment_count: Field::Number,
    duration: Field::Number,
    is_hd: Field::Boolean,
    embed_html: Field::String,
    video_id: Field::String,
    video_type: Field::String,
    is_pro: Field::Boolean,
    summary_md: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :title,
    :summary,
    :created_at,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :users,
    :id,
    :title,
    :summary,
    :created_at,
    :updated_at,
    :published_at,
    :thumbnail_url,
    :channel_id,
    :channel_title,
    :category_id,
    :category_title,
    :view_count,
    :like_count,
    :dislike_count,
    :favorite_count,
    :comment_count,
    :duration,
    :is_hd,
    :embed_html,
    :video_id,
    :video_type,
    :summary_md,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :users,
    :title,
    :summary,
    :published_at,
    :thumbnail_url,
    :channel_id,
    :channel_title,
    :category_id,
    :category_title,
    :view_count,
    :like_count,
    :dislike_count,
    :favorite_count,
    :comment_count,
    :duration,
    :is_hd,
    :embed_html,
    :video_id,
    :video_type,
    :summary_md,
  ].freeze

  # Overwrite this method to customize how videos are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(video)
  #   "Video ##{video.id}"
  # end
end
