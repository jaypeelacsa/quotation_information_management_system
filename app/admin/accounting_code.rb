ActiveAdmin.register AccountingCode do
  
  controller do
    def permitted_params
      params.permit!
    end
  end
  index do
    selectable_column
    id_column
    column :name
    column :code
    column :current_sign_in_at
    column :created_at
    actions
  end

  filter :code
  filter :name
  filter :current_sign_in_at
  filter :created_at

  form do |f|
    f.inputs "Accounting Code Details" do
      f.input :name
      f.input :code
    end
    f.actions
  end

end
