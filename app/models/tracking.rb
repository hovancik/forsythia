class Tracking < ActiveRecord::Base
  belongs_to :user
  belongs_to :client

  def self.group_by_day(trackings)
    trackings.order('started_at desc').group_by { |t| t.started_at.beginning_of_day }
  end
end
