require 'timepad-api'

limit = 50
start = 1
total = 0
iidf = 22219
params = {
  limit: limit,
  skip: start,
  organization_ids: iidf,
  fields: 'location',
  starts_at_min: '2014-01-01',
  access_statuses: 'private,draft,link_only,public',
  sort: 'starts_at'
}
api_client = TimepadApi::Client.new(ENV['TIMEPAD_TOKEN'])

begin
  sleep(3.0)
  events = api_client.event.list params
  events =
  # load to DB
  total += events.count
  print "#{Time.now} page: #{params[:skip]}, events: #{events.count}/#{total} \r";
  params[:skip] = total
end until events.count == 0

