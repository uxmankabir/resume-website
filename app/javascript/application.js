// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import "https://kit.fontawesome.com/8fd3d3706e.js"

document.addEventListener("mousemove", function (e) {
  document.querySelector(".cursor").style.setProperty('--x', e.clientX - 7 + 'px');
  document.querySelector(".cursor").style.setProperty('--y', e.clientY - 5 + 'px');
});
