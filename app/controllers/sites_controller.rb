class SitesController < ApplicationController
  before_filter :authenticate_user!, only: [:edit, :update, :destroy]
  respond_to :html, :json, :atom

  def index
    @search = Site.search(params[:q])
    @sites = @search.result.page(params[:page]).per(params[:per])
    @sites = @sites.order('id DESC') if @search.sorts.empty?
    respond_with @sites
  end

  def show
    @site = Site.find(params[:id])
    respond_with @site
  end

  def new
    session[:user_return_to] = new_site_path unless user_signed_in?
    @site = Site.new
  end

  def edit
    @site = current_user.sites.find(params[:id])
  end

  def create
    @site = Site.new(site_params.merge(user: current_user))
    flash[:notice] = t('sites.create.created') if @site.save && !request.xhr?
    respond_with @site, location: sites_url
  end

  def update
    @site = current_user.sites.find(params[:id])
    flash[:notice] = t('sites.update.updated') if @site.update(site_params) && !request.xhr?
    respond_with @site, location: sites_url
  end

  def destroy
    @site = current_user.sites.find(params[:id])
    flash[:notice] = t('sites.destroy.destroyed') if @site.destroy && !request.xhr?
    respond_with @site, location: sites_url
  end

  private
  def site_params
    params.require(:site).permit(
      :user_id, :name, :url, :description, :creator, :hash_tag,
      :repository_url, :scheduled_access, :please_design)
  end
end
