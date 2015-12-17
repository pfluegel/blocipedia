class WikiPolicy < ApplicationPolicy
  attr_reader :current_user, :wiki, :user

  def initialize(current_user, wiki)
    @current_user = current_user
    @wiki = wiki
    @user = user
  end

  def edit?
    current_user.standard? || current_user.admin?
  end

  def new?
    current_user.standard? || current_user.admin?
  end

  def destroy?

    current_user.admin? || current_user == wiki.user
    end
end