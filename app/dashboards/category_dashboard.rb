require "administrate/base_dashboard"

class CategoryDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    id: Field::Number.with_options(searchable: false),
    name: Field::String.with_options(searchable: true),
    created_at: Field::DateTime.with_options(searchable: false),
    updated_at: Field::DateTime.with_options(searchable: false),
  }.freeze

  COLLECTION_ATTRIBUTES = [
    :id,
    :name,
  ].freeze


  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :name,
  ].freeze

  FORM_ATTRIBUTES = [
    :id,
    :name,
  ].freeze
end
