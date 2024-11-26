// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

document.addEventListener('DOMContentLoaded', () => {

  const inputCheck = document.querySelector('#dark-mode-switch');
  const body = document.querySelector('body');

  const savedTheme = localStorage.getItem('theme') || 'light';
  body.setAttribute('data-bs-theme', savedTheme);

  if (inputCheck) {
    inputCheck.checked = savedTheme === 'dark';

    inputCheck.addEventListener('change', () => {
      const mode = inputCheck.checked ? 'dark' : 'light';
      body.setAttribute('data-bs-theme', mode);

      localStorage.setItem('theme', mode);
    });
  }
});

