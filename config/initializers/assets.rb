# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

Rails.application.config.assets.precompile += %w( application.css application.js )
Rails.application.config.assets.precompile += %w( default.css default.js )
Rails.application.config.assets.precompile += %w( agent.css agent.js )
Rails.application.config.assets.precompile += %w( brand.css brand.js )
Rails.application.config.assets.precompile += %w( distributor.css distributor.js )

Rails.application.config.assets.precompile += %w( datatables.js )
Rails.application.config.assets.precompile += %w( job_posts.js )
Rails.application.config.assets.precompile += %w( contractors.js )
