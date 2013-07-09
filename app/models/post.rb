class Post < ActiveRecord::Base
  attr_accessible :title
  class << self
    def transactional_create
      transaction do
        3.times do |i|
          create(title: "title#{i}")
          raise ActiveRecord::Rollback if i == 2
        end
      end
    end
  end
end
