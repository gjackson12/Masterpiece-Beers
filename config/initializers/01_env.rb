if Rails.env.development? || Rails.env.test?
  ENV['SECRET_TOKEN'] = 'whateveryouwantthistobe'
  ENV['FB_Application_ID'] = "213532462155598"
  ENV['FB_Secret'] = "0c6c56936f17d7513c865d26b394ab52"
end