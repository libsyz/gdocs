require "google/apis/docs_v1"
require "googleauth"
require "googleauth/stores/file_token_store"
require "fileutils"
require "pry"
require 'json'

OOB_URI = "urn:ietf:wg:oauth:2.0:oob".freeze
APPLICATION_NAME = "sheets".freeze
CREDENTIALS_PATH = "credentials.json".freeze
# The file token.yaml stores the user's access and refresh tokens, and is
# created automatically when the authorization flow completes for the first
# time.
TOKEN_PATH = "token.yaml".freeze
SCOPE = Google::Apis::DocsV1::AUTH_DOCUMENTS

##
# Ensure valid credentials, either by restoring from the saved credentials
# files or intitiating an OAuth2 authorization. If authorization is required,
# the user's default browser will be launched to approve the request.
#
# @return [Google::Auth::UserRefreshCredentials] OAuth2 credentials
def authorize
  client_id = Google::Auth::ClientId.from_file CREDENTIALS_PATH
  token_store = Google::Auth::Stores::FileTokenStore.new file: TOKEN_PATH
  authorizer = Google::Auth::UserAuthorizer.new client_id, SCOPE, token_store
  user_id = "default"
  credentials = authorizer.get_credentials user_id
  if credentials.nil?
    url = authorizer.get_authorization_url base_url: OOB_URI
    puts "Open the following URL in the browser and enter the " \
         "resulting code after authorization:\n" + url
    code = gets
    credentials = authorizer.get_and_store_credentials_from_code(
      user_id: user_id, code: code, base_url: OOB_URI
    )
  end
  credentials
end

# Initialize the API
service = Google::Apis::DocsV1::DocsService.new
service.client_options.application_name = APPLICATION_NAME
service.authorization = authorize

# Prints the title of the sample doc:
# https://docs.google.com/document/d/195j9eDD3ccgjQRttHhJPymLJUCOUjs-jmwTrekvdjFE/edit
document_id = "1fziLwLANRYyN4OZ1rs5DdL5VFrlUE0jrOPosr1Ohnyw"
document = service.get_document document_id
# Get a document
#  puts "The title of the document is: #{document.title}."
# Write into a document
insert_text = Google::Apis::DocsV1::Request.new(
         {
            insert_text: { text: "hello tiny!!",
                           end_of_segment_location: ""
                         }
        })


update = Google::Apis::DocsV1::BatchUpdateDocumentRequest.new({requests: [insert_text]})

# We know the batch update request clearly expects a Hash because it calls each_with_index on the args

service.batch_update_document(document_id, update)




