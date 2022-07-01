# frozen_string_literal: true

class ProfilePolicy < ApplicationPolicy
  def update?
    owner_of_record?
  end

  def edit?
    owner_of_record?
  end

  def show?
    owner_of_record?
  end
end
