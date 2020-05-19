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
//
//= require rails-ujs
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require activestorage
//= require turbolinks
//= require_tree .

var cnt = {
    num: 0
};
submit_message = function() {
    $('#input_msg').on('keydown', function(e) {
        if (e.keyCode == 13) {
            $('#button').click();
            cnt.num = 1;
            e.target.value = "";
            location.reload();
        };
    });
};
this method is simialr to first js method above
//Jquery initialize
$(document).ready(function(){    
    //Check if the current URL contains '# or hash'
    if(document.URL.indexOf("#")==-1){
        // Set the URL to whatever it was plus "#loaded".
        url = document.URL+"#loaded";
        location = "#loaded";
        //Reload the page using reload() method
        location.reload(true);
    }
});
$(document).on('click', function() {
    $('.ui.dropdown').dropdown();
    $('.message .close').on('click', function() {
        $(this).closest('.message').transition('fade');
    });
    if( cnt.num != 0 ){
        cnt.num = 0;
        location.reload();
    }
    submit_message();
})
