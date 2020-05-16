class Post < ApplicationRecord
    belongs_to :profile, foreign_key: 'profile_id'
end
