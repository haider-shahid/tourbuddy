// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//= require jquery
//= require popper
//= require bootstrap
//= require cocoon

// Loads all Semantic javascripts
//= require semantic-ui
//
//= require rails-ujs
//= require turbolinks
//= require_tree .

$(document).on('turbolinks:load',function(){
    $('.ui.dropdown').dropdown();
    $('.message .close').on('click', function()
    {
        $(this).closest('.message').transition('fade');
    });

});
function showImage() {
    if (this.files && this.files[0]) {
        var reader = new FileReader();

        reader.onload = function (data) {
            var image = document.getElementById("img_prev");
            var UpImage = document.getElementById("upload_image");
            UpImage.style.display = "none";
            var btn = document.getElementById("upload_image_text");
            image.src = data.target.result;
            image.style.display = "block";
            btn.innerText = " Change Image";
        };

        reader.readAsDataURL(this.files[0]);
    }
}