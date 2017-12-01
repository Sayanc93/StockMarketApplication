class User < ApplicationRecord
  has_many :portfolios

  # Create user with credentials if it doesn't already exist in DB.
  def self.from_omniauth(auth)
    current_user = where(uid: auth.uid)
                    .first_or_create(name: auth.info.name,
                                     token: auth.credentials.token,
                                     secret: auth.credentials.secret,
                                     provider: auth.provider,
                                     email: auth.info.email)
    current_user
  end
end
