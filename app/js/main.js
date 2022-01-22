$('#r_submit').bind('click',function(){
    var error = 0;

    var rege = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/

    if($('#r_emailaddress').val() == "") {
        $('#r_emailaddress').val('Enter your email...');
        error = 1;
    }

    if($('#r_emailaddress').val() != "" && !rege.test($('#r_emailaddress').val())) {
        $('#r_emailaddress').val('Please enter a valid email address...');
        error = 1;
    }

    if(error === 0) {
        $('#r_form').submit();
    }
});

$('#r_emailaddress').click(function() {
    var str_val = $('#r_emailaddress').val();

    if(str_val == 'Enter your email...' || str_val == 'Please enter a valid email address...')
    {
        $('#r_emailaddress').val('');
    }
});
