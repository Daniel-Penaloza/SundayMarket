require "administrate/base_dashboard"

class ProductDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    id: Field::Number.with_options(searchable: false),
    name: Field::String.with_options(searchable: true),
    price: Field::Number.with_options(
      searchable: false,
      prefix: "$",
      decimals: 2,
      ),
    description: Field::String.with_options(searchable: true),
    image: Field::Image.with_options(searchable: false),
    summary: Field::Text.with_options(searchable: false),
    created_at: Field::DateTime.with_options(searchable: false),
    updated_at: Field::DateTime.with_options(searchable: false),
  }.freeze

  COLLECTION_ATTRIBUTES = [
    :id,
    :name,
    :summary,
    :price,
    :image,
  ].freeze

  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :name,
    :price,
    :description,
    :summary,
    :image,
  ].freeze

  FORM_ATTRIBUTES = [
    :id,
    :name,
    :price,
    :description,
    :summary,
  ].freeze
end
