class ContractorProfile < ApplicationRecord
  belongs_to :user

  has_attached_file :logo, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment :logo, content_type: { content_type: ["image/jpeg", "image/png"] }

  def self.search(query)
    query_wildcard = "%#{query.downcase}%"

    self.joins(:user => :country).where(
      "lower(users.company_name) LIKE ? OR "\
      "lower(countries.name) LIKE ? OR "\
      "lower(contact_person) LIKE ? OR "\
      "lower(contact_position) LIKE ? OR "\
      "lower(contact_email) LIKE ? OR "\
      "lower(description) LIKE ?",
      query_wildcard,
      query_wildcard,
      query_wildcard,
      query_wildcard,
      query_wildcard,
      query_wildcard,
    )
  end
end
