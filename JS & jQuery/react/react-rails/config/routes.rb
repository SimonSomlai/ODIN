Rails.application.routes.draw do
  resources :records
  post "find-record" => "records#find_record"
end
