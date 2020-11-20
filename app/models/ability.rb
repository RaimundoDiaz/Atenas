# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    #If the user is a prosecutor
    if user.prosecutor.present?
      can :manage, Procedure, local_prosecution_in_charge: user.prosecutor
      can [:create,:index,:show], Message do |msg|
        Procedure.find(msg.procedure_id).local_prosecution_in_charge.id == user.prosecutor.id
      end
    elsif user.police_unit.present?
      can :manage, Procedure, police_unit_in_charge: user.police_unit
      can [:create,:index,:show], Message do |msg|
        Procedure.find(msg.procedure_id).police_unit_in_charge.id == user.police_unit.id
      end
    end
  end
end