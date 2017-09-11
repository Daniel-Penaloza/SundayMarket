class UserPolicy < ApplicationPolicy

	def show?
		return true if not_banned? || user_or_admin
	end

	def edit?
		return true if user_or_admin
	end

	def update?
		return true if user_or_admin
	end

	def ban_seller?
		return true if admin?
	end

	def unban_seller?
		return true if admin?
	end

	private
		def user_or_admin
			record && (record.id == user.id || admin?)
		end

		def admin?
			admin_types.include?(user.type)
		end

		def not_banned?
			!user.ban
		end

		#def seller_approved
			#Need to think in the behavior for the banned user feature
		#end
end