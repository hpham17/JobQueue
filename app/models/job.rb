class Job < ApplicationRecord
  after_create :make_job

  private
    def make_job
      PageRequestJob.perform_later self.url, self.id
    end
end
