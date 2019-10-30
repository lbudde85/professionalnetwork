
Rails.application.config.copy_assets = [
  ['vendor/pages/pages-core/fonts/pages-icon', 'public/assets/fonts/pages-icon'],
  ['vendor/pages/pages-core/fonts/montserrat', 'public/assets/fonts/montserrat'],
  ['vendor/pages/pages-core/img', 'public/assets/img'],
  ['vendor/pages/pages-plugins/jquery-datatable/media/images', 'public/assets/images'],
  ['vendor/pages/pages-plugins/dropzone/images', 'public/assets/images'],

  ['vendor/pages/pages-core/fonts/pages-icon', 'public/fonts/pages-icon'],
  ['vendor/pages/pages-core/fonts/montserrat', 'public/fonts/montserrat'],
  ['vendor/pages/pages-core/img', 'public/img'],
  ['vendor/pages/pages-plugins/jquery-datatable/media/images', 'public/images'],
  ['vendor/pages/pages-plugins/dropzone/images', 'public/images'],

  ['app/assets/javascripts/en.datatables.json', 'public/assets'],
  ['app/assets/javascripts/de.datatables.json', 'public/assets'],
]
