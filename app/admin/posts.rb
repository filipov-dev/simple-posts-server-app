ActiveAdmin.register Post do
  permit_params :title, :alias, :preview, :content, :published_at

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :alias, :preview, :content, :published_at, :deleted_at
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :alias, :preview, :content, :published_at, :deleted_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f|
    f.semantic_errors
    f.inputs :title, :alias

    f.input :preview, as: :hidden
    f.li class: 'string input required stringish' do
      f.legend class: 'label editorjs-label' do
        f.label :preview do
          f.abbr title: :required do
            '*'
          end
        end
      end
      f.div class: :editorjs, id: 'preview-editor'
    end
    f.script { 'initEditorJS("preview", "post_preview", ["header"]);'.html_safe }

    f.input :content, as: :hidden
    f.li class: 'string input required stringish' do
      f.legend class: 'label editorjs-label' do
        f.label :content do
          f.abbr title: :required do
            '*'
          end
        end
      end
      f.div class: :editorjs, id: 'content-editor'
    end
    f.script { 'initEditorJS("content", "post_content", ["header"]);'.html_safe }

    f.input :published_at, as: :date_time_picker

    f.actions
  end
end
