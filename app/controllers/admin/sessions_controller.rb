# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  protected

  def after_sign_in_path_for(resource)
    admin_listings_path
  end
end
