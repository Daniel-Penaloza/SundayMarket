class ProductPolicy < ApplicationPolicy


	def new?
		return true if user_not_banned? 
	end
	
	def create?
		return true if user_not_banned?
	end

	def show?
		return true if creator_not_banned? || user_or_admin
	end

	def edit?
		return true if user_or_admin
	end

	def update?
		return true if user_or_admin
	end

	def destroy?
		return true if user
	end

		private

	def user_not_banned?
		user && (!user.ban || admin?)
	end

	def creator_not_banned?
		record.user.ban == false
	end

	def user_or_admin
		user && (record.user.id == user.id || admin?)
	end

	def admin?
		admin_types.include?(user.type)
	end
end
