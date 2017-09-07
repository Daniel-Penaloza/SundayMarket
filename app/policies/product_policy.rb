class ProductPolicy < ApplicationPolicy
	def edit?
		return true if user_or_admin
	end

	def update?
		return true if user_or_admin
	end

	def destroy?
		return true if user_or_admin
	end

	private
		def user_or_admin
			record.id == user.id || admin?
		end

		def admin?
			admin_types.include?(user.type)
		end
end