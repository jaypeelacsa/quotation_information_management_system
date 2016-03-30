ActiveAdmin.register User do
  
  controller do
    def permitted_params
      params.permit!
    end
  end

  # scope_to :current_user, if:     proc{ current_user.limited_access? }
  # scope_to :current_user, unless: proc{ current_user.admin_user? }
  
  # actions :all, except: [:update, :destroy]

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :firstname
      f.input :middlename
      f.input :lastname
      f.input :username
      f.input :role, as: :select, collection: User::ROLE
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end

# ActiveAdmin.register User do
# 	actions :all
# 	controller do
# 		def permitted_params
# 			params.permit!
# 		end
# 	end


# 	filter :firstname

	# index do
	# 	column :firstname
	# 	column :middlename
	# 	column :lastname
	# 	column :username
	# 	column :role
	# 	actions
	# end


 #  index do
 #    column :firstname
 #    column :middlename
 #    column :lastname
 #    column :username
 #    actions
 #  end

 #  form do |f|
 #    f.inputs 'User' do
 #    	f.input :email
 #    	f.input :encrypted_password
 #      f.input :firstname
 #      f.input :middlename
 #      f.input :lastname
 #      f.input :username
 # 			f.input :role, as: :select, collection: User::ROLE

 #    end
 #    f.actions
 #  end
	# end