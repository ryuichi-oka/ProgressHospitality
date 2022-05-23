json.array!(@events) do |event|
  json.id event.id
  json.title event.event
  json.date event.date
end