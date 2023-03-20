Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '1035992843822-1qmsudtsptggkdsqdef2ekakj2a3tpdr.apps.googleusercontent.com', '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'
end
