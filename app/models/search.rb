
class Search
  
  SEARCH_FIELDS = {
    :tickets => :ticket_subject,
   # :companies => :company_name,
   # :company_offices => :office_name,
   # :conversations => :notes
  }
  
  
  def self.do(q)
    SEARCH_FIELDS.map do |k,v|
      DB[k].select(v => :result, k.to_s.camelcase => :model, :id => :id).where(Sequel.ilike(v, "%#{q}%") )
    end.reduce(:union)
  end   
end
