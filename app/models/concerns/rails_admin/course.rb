# frozen_string_literal: true

module RailsAdmin::Course
  extend ActiveSupport::Concern

  included do
    rails_admin do
      include_all_fields
      label 'Курс'
      label_plural 'Курсы'
      navigation_icon 'icon-news'

      group 'Главная информация' do
        field :title
        field :short_description
        field :description, :ck_editor
        field :category do
          nested_form false
          inline_add false
          inline_edit false
        end
      end

      group 'Дополнительная информация' do
        active false
        field :date_start
        field :date_end
        field :duration
        field :price
        field :students_count
        field :duration_type
        field :is_main
      end

      group 'Преподаватели' do
        active false
        field :teachers do
          nested_form false
        end
      end

      group 'Разное' do
        active false
        field :slider
        field :services
      end

      group 'Галерея' do
        active false
        field :image_banners
        field :images
      end

      # group 'Дополнительная информация' do
      #   active false
      #   # field :user do
      #   #   visible true
      #   #   help ''
      #   #   default_value do
      #   #     def selected_id
      #   #       bindings[:view]._current_user
      #   #     end
      #   #   end
      #   # end
      #   # field :is_commentable, :boolean
      #   field :thread
      # end

      group 'Cтатистическа информация' do
        active false
        field :watches_count do
          read_only true
        end

        field :user_id, :hidden do
          def value
            bindings[:view]._current_user.id
          end
        end
      end

      list do
        exclude_fields :updated_at,
                       :description,
                       :short_description,
                       :slug,
                       :user
        field :images do
          pretty_value do
            bindings[:view].tag(:img, src: bindings[:object].images.first.url(:thumb)) if bindings[:object].images.present?
          end
        end
      end

      edit do
        exclude_fields :thread, :impressions, :user, :slug
      end

      create do
        exclude_fields :thread, :impressions, :user, :slug
      end

      show do
        exclude_fields :updated_at,
                       :description
        field :images do
          inverse_of :assetable
          pretty_value do
            if bindings[:object].images.present?
              result = ''
              bindings[:object].images.each do |item|
                result += bindings[:view].tag(:img, src: item.url(:thumb))
              end
              result.html_safe
            end
          end
        end
      end
    end
  end
end
