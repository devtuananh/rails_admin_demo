RailsAdmin.config do |config|

  config.main_app_name = ["Experiment With Rails Admin", ""]

  config.included_models = ["User", "Post", "Comment"]
  ### Popular gems integration
  RailsAdmin.config do |config|
    config.model "User" do
      list do
        exclude_fields :id, :created_at
        fields :username do
          label "User name"
        end
        fields :email do
          label "Email"
        end
        fields :password do
          label "Password"
        end

        fields :address do
          label "Address"
        end

        fields :phone do
          label "Phone"
        end
      end

      fields :username do
        label "User name"
      end

      fields :email do
        label "Email"
      end
      fields :password do
        label "Password"
      end

      fields :address do
        label "Address"
      end

      fields :phone do
        label "Phone"
      end
    end

    config.parent_controller = "::ApplicationController"
    config.authorize_with do |controller|
      unless current_user && current_user.admin?
        redirect_to(
          main_app.root_path,
          alert: "You are not permitted to view this page"
        )
      end
    end
   end

  ## == Devise ==
  config.authenticate_with do
  warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export do
      only ["User", "Post"]
    end
    bulk_delete
    show do
    end
    edit do
      only ["User", "Post"]
    end
    delete do
      only ["Post", "Comment"]
    end
    show_in_app
    ## With an audit adapter, you can add:
    # history_index
    # history_show
   end
end
