json.array!(@excersises) do |excersise|
  json.extract! excersise, :id, :name, :sets, :reps
  json.url excersise_url(excersise, format: :json)
end
