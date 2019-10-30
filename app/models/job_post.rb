class JobPost < ApplicationRecord
  belongs_to :user

  has_attached_file :file_attachment
  validates_attachment :file_attachment, content_type: {
    content_type: [
      "application/pdf",
      "application/msword",
      "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
    ]
  }

  enum experence_level: [ :expert, :intermediate, :entry ]
  enum job_period: [ :more_then_6_months, :less_then_6_months ]

  def self.search(query)
    query_wildcard = "%#{query.downcase}%"

    self.joins(:user).where(
      "lower(users.company_name) LIKE ? OR "\
      "lower(title) LIKE ? OR "\
      "lower(description) LIKE ? OR "\
      "lower(qualifications) LIKE ? OR "\
      "lower(questions) LIKE ?",
      query_wildcard,
      query_wildcard,
      query_wildcard,
      query_wildcard,
      query_wildcard,
    )
  end
end
