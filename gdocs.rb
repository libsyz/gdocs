require 'bundler'

Bundler.require

# Authenticate a session with your Service Account
session = GoogleDrive::Session.from_service_account_key("client_secrets.json")


def unique_shuffle(array)
  shuff = array.shuffle
    if @combination_array.include?(shuff)
      unique_shuffle(shuff)
    else
      @combination_array << shuff
    end
end

bs_bingo_words = %w(Test Driven Development Story Time  Epic  Waterfall Manifesto
Done  Task Board  Unit Test Time-box  Backlog
Sprint Review Pigs  AGILE BINGO
(free square) Emergent  Spike
Burn-down Scrum User Story  Pattern Kaizen
Story Point Estimation Refactor Regression test Stand-up)

@combination_array = []
participants_number = 20

# Get the spreadsheet by its title
@spreadsheet = session.spreadsheet_by_title("Bingo")
# Get the first worksheet
@worksheet = @spreadsheet.worksheets.first
# Print out the first 6 columns of each row


col = 1

20.times do
   unique_shuffle(bs_bingo_words)
   uniq = @combination_array.last
   uniq.each_with_index do |word, i|
    @worksheet[i+1, col] = word
   end
   col += 1
end

@worksheet.save

