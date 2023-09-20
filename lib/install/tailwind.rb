say "Installing tailwindcss dependencies"
additional_packages  = "@tailwindcss/aspect-ratio @tailwindcss/forms @tailwindcss/typography"
run "yarn add @rails/ujs"
run "yarn add tailwindcss #{additional_packages}"

say "Copying tailwindcss config to app/javascript/stylesheets/tailwind.config.js"
copy_file "#{__dir__}/config/tailwind.config.js", Jets.root.join("app/javascript/stylesheets/tailwind.config.js").to_s

say "Adding tailwind path to postcss.config.js"
insert_into_file Jets.root.join("postcss.config.js").to_s,
  "\n    require('tailwindcss')('app/javascript/stylesheets/tailwind.config.js'),",
   after: "plugins: ["

say "Importing tailwind in theme.scss"
prepend_to_file Jets.root.join("app/javascript/packs/theme.scss").to_s,
  "@import 'tailwindcss/base';\n@import 'tailwindcss/components';\n@import 'tailwindcss/utilities';"

say "Webpacker now supports Tailwind 🎉", :green
