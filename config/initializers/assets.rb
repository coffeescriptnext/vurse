Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile += %w(
  snippety.css
  snippety-authentication.css
  snippety-email.css
  snippety.js
)

if Rails.env.development? || Rails.env.test?
  Rails.application.config.assets.precompile += %w(
    mocha/1.17.1.js
    teaspoon.css
    teaspoon-mocha.js
    teaspoon-teaspoon.js
  )
end
