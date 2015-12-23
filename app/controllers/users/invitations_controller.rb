class Users::InvitationsController < Devise::InvitationsController


  # POST /resource/invitation
  def create
   self.resource = invite_resource
   
   resource_invited = resource.errors.empty?


   yield resource if block_given?

   if resource_invited
     if is_flashing_format? && self.resource.invitation_sent_at
       set_flash_message :notice, :send_instructions, :email => self.resource.email
     end
     @users = User.all
   else
     respond_with_navigational(resource) { render :new }
   end
  end

  private
        def invite_resource
            resource_class.invite!(invite_params, current_inviter) do |invitable|
                invitable.company_id = current_user.company_id
            end
        end


 end
