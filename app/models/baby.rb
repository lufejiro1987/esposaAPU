class Baby < ApplicationRecord
  has_many :breastfeedings, dependent: :delete_all

  def total_breastfeeding_time
    self.breastfeedings.sum(:time) rescue 0
  end

  def total_breastfeeding_quantity
    self.breastfeedings.sum(:quantity) rescue 0
  end

  def times_breastfeeded_today
    self.breastfeedings.where(created_at: (Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)).count rescue 0
  end

  def last_breastfeeded
    self.breastfeedings.order(created_at: 'desc').first.created_at rescue nil
  end

  def breastfeeding_time_today
    self.breastfeedings.where(created_at: (Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)).sum(:time) rescue 0
  end

  def breastfeeding_quantity_today
    self.breastfeedings.where(created_at: (Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)).sum(:quantity) rescue 0
  end

end
