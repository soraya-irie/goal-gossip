// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener('turbo:load', function() {
  const hamburger = document.querySelectorAll('#hamburger, .close');
  const nav = document.querySelector('.sp-nav');

  hamburger.forEach(element => {
    element.addEventListener('click', function() {
      nav.classList.toggle('toggle');
    });
  });
});
