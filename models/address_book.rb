require_relative 'entry'
require "csv"

class AddressBook
  attr_accessor :entries

  def initialize
    @entries =[]
  end

  def add_entry(name, phone_number, email)

    index = 0
    @entries.each do |entry|

      if name < entry.name
        break
      end
      index += 1
    end

    @entries.insert(index, Entry.new(name, phone_number, email))

  end

  def remove_entry(name, phone_number, email)
    #loop through all the entries
    @entries.each_with_index do |entry, index|
    #if the entry name, phone, and email match the arguments,
      if entry.name == name && entry.phone_number == phone_number && entry.email == email
        # delete it from the array
        @entries.delete(entry)
      end
    end
  end

  def import_from_csv(file_name)
    csv_text = File.read(file_name)
    csv = CSV.parse(csv_text, headers: true, skip_blanks: true)

    csv.each do |row|
      row_hash = row.to_hash
      add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
    end

    
  end
end
