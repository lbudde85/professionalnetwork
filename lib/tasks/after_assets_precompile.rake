require 'fileutils'

namespace :assets do
  def after_assets_precompile
    Rails.application.config.copy_assets.each do |asset|
      if File.directory?(asset[0])
        from_path = File.join(Rails.root, asset[0], '/.')
      else
        from_path = asset[0]
      end

      to_path = File.join(Rails.root, asset[1])

      FileUtils.mkdir_p(to_path)
      FileUtils.cp_r from_path, to_path
    end
  end

  task :after_assets_precompile_hook => :environment do
    at_exit { after_assets_precompile }
  end

  Rake::Task['assets:precompile'].enhance(['assets:after_assets_precompile_hook'])
end
