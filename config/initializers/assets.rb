Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile += %w(
  vurse.css
  vurse-authentication.css
  vurse-editor.css
  vurse-editor.js
  vurse-email.css
  vurse.js
)

if Rails.env.development? || Rails.env.test?
  Rails.application.config.assets.precompile += %w(
    mocha/1.17.1.js
    teaspoon.css
    teaspoon-mocha.js
    teaspoon-teaspoon.js
  )
end
