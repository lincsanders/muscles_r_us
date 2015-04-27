json.array!(@workout_sessions) do |workout_session|
  json.extract! workout_session, :id, :workout_id
  json.url workout_session_url(workout_session, format: :json)
end
