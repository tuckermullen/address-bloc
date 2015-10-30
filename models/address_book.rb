require_relative 'entry'

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
end
