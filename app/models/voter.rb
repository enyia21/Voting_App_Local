class Voter < ActiveRecord::Base
    has_one :ballot
    has_many :proposals, through: :ballot
    has_secure_password

    def slug
        self.user_name.gsub(/\W/, "-").downcase
    end

    def self.find_by_slug(slug)
        self.all.detect{|t| slug == t.slug}
    end

    def is_valid?
        if self.user_name=="" || self.user_name==nil
            false
        elsif self.first_name=="" || self.first_name==nil
            false
        elsif self.last_name=="" || self.last_name==nil
            false
        elsif self.password_digest == "" || self.password ==nil
            false
        elsif self.email=="" || self.email==nil
            false
        elsif self.drivers_license=="" || self.drivers_license==nil
            false
        elsif self.street_address=="" || self.street_address==nil
            false
        elsif self.city=="" || self.city==nil
            false
        elsif self.zipcode=="" || self.zipcode==nil
            false
        else
            true
        end
    end
end