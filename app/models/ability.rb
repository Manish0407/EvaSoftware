# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    case user.role
    when 'super_admin'
      can :manage, :all
    when 'admin'
      can :manage, Employee
      cannot :destroy, Employee

      can :manage, Account
      cannot :destroy, Account

      can :manage, AdminUser
      cannot :create, AdminUser
      cannot :update, AdminUser
      cannot :destroy, AdminUser

      can :manage, ActiveAdmin::Page, name: 'Dashboard', namespace_name: 'admin'

    # when 'employee'
    #     cannot :create, RawMaterialPrice
        
        # can :manage, AdminUser
        # cannot :destroy, AdminUser

        # can [:read], BxBlockSettings::TermAndCondition
        # can [:read], BxBlockSettings::PrivacyPolicy
        # can [:read], BxBlockSettings::AboutMaterra

        # can :read, BxBlockChat::Chat
        # can :manage, ActiveAdmin::Page, name: 'Dashboard', namespace_name: 'admin'
        # can :read, BxBlockChat::ChatMessage
        # can :manage, BxBlockImport::Import
    end
  end
end
