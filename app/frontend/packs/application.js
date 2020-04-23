import '../stylesheets/application'
import 'materialize-css/dist/js/materialize'

require("jquery")
require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

// Custom javascripts
require("javascripts/forms")
require("javascripts/nav")
require("javascripts/room")
require("javascripts/tabs")

// ActionText
require("trix")
require("@rails/actiontext")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
