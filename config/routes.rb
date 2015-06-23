Rails.application.routes.draw do
  root 'reports#email'
  get 'reports/all_data'
  post 'confirmation' => 'reports#confirmation'
end
