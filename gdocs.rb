


require 'pry'
require 'bundler'
Bundler.require

bs_bingo_words = %w(Test Driven Development Story Time  Epic  Waterfall Manifesto
Done  Task Board  Unit Test Time-box  Backlog
Sprint Review Pigs  AGILE BINGO
(free square) Emergent  Spike
Burn-down Scrum User Story  Pattern Kaizen
Story Point Estimation Refactor Regression test Stand-up)

# Generate some random agile words - Done

@combination_array = []

def unique_shuffle(array)
  shuffled = array.shuffle
    if @combination_array.include?(shuffled)
      unique_shuffle(shuff)
    else
      @combination_array << shuff
    end
end

# Make a copy of a template in the folder
## Create the template on my google docs - Done
## Activate the Google Docs API - Done
## Authenticate into Gdrive -

gdrive_session = GoogleDrive::Session.from_service_account_key("client_secrets.json")
## Fetch the document
gdrive_session.files.each do |file|
  p file.title
end

binding.pry

puts "hello"

## Make a copy and provide the file with a name - Done, but through a normal POST API, with no library!!
## What is the fucking point!

## Authenticate into Google Docs - NO RUBY LIBRARY FOR GDOCS


# Get that last document that was just generated
# That document should have a table inside with the exact number of cells
# for the words that we got
# Iterate through the cells and add the document
