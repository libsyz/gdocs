require 'pry'
require 'bundler'
Bundler.require


# Initialize the client with your Bearer API key
# (add this to config/initializers/bearer.rb)
Bearer::Configuration.setup do |config|
  config.api_key = 'sk_sandbox_SIY13hyGui7kUjCqKd0HcZfQhnp9qAFB'
end
# Call an endpoint of your api
# Bearer.integration('google_docs')
#   .auth('ac727aa0-e0ef-11e9-9c0c-8ba5d28524e8')
#   .post('documents', query: { title: "Bearer 🐻" })

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

## Make a copy and provide the file with a name


## Authenticate into Google Docs -

# Get that last document that was just generated
# That document should have a table inside with the exact number of cells
# for the words that we got
# Iterate through the cells and add the document
