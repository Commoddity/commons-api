require_relative "../helpers/xml_to_json_helper"
include XmlToJsonHelper

require "dotenv"
Dotenv.load
require "pry"
require "faraday"
require "faraday_middleware"

# Sends read call to uClassify
# inputs: text {string} - text to classify
#         read_action {string} - one of the three actions "classify", "keywords", "getInformation"
def uclassify_read(text, read_action)
  base_url = "https://api.uclassify.com/v1/"
  username = "Frederick"
  classifierName = "LHL_midterm_classifier"

  uri = "#{base_url}#{username}/#{classifierName}/#{read_action}"

  faraday = Faraday.new(url: uri) do |conn|
    # conn.token_auth("#{ENV["UCLASSIFY_API_READ_KEY"]}") # this doesn't work???? must put in header.
    # conn.request :json, :content_type => /\bjson$/
    # conn.response :json, :content_type => /\bjson$/
    conn.adapter :net_http
  end

  body = {
    texts: [text["title"]],
  }

  pp "body"
  pp body

  pp "body.to_json"
  pp "#{body.to_json}"

  res = faraday.post do |req|
    req.headers["Content-Type"] = "application/json"
    req.headers["Authorization"] = "Token #{ENV["UCLASSIFY_API_READ_KEY"]}"
    req.body = body.to_json
    # req.body = "{\"texts\": [\"hello\"]}"
  end
end

file_data = File.read(__dir__ + "/training_data/publications_with_category.xml")

# File.write(__dir__ + "/test.json", (xml_to_json(file_data)))
items = JSON.parse(xml_to_json(file_data))["rss"]["channel"]["item"]
bill_items = items.select do |item|
  item["title"].include? "Legislative Summary"
end

# pp bill_items[0..4]

# bill_items.each do |bill|
#   puts bill["title"]
#   puts "======"

#   if bill["category"].kind_of?(Array)
#     bill["category"].each do |cat|
#       puts cat
#     end
#   elsif bill["category"].kind_of?(String)
#     puts bill["category"]
#   end

#   puts ""
# end

# binding.pry

pp bill_items.first
pp uclassify_read(bill_items.first, "classify")
