json.array!(@departments) do |department|
  json.extract! department, :id, :domain, :desc
  json.url department_url(department, format: :json)
end
