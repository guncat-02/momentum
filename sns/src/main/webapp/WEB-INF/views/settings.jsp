<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kor">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Settings</title>
</head>
<link rel="stylesheet" href="./resources/css/settings.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
    integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
    crossorigin="anonymous" referrerpolicy="no-referrer">
</script>
<script src="/sns/resources/JS/setTheme.js"></script>
<link id="theme-setting" rel="stylesheet" href="/sns/resources/css/dark_theme.css">
<body class="theme">
    <main>
        <div id="settings-menu">
            <ol>
                <h1>Settings</h1>
                <label>
                    <li><h2>Account</h2></li>
                </label>
                <ol id="settings-account">
                    <input type="hidden" value="0">
                    <li id="settings-member-info"><h4>Member Info</h4></li>
                    <li id="settings-profile"><h4>Profile</h4></li>
                </ol>
                <li id="settings-display"><h2>Display</h2></li>
                <label>
                    <li><h2>Use</h2></li>
                </label>
                <ol id="settings-use">
                    <input type="hidden" value="0">
                    <li><h4>Alarm</h4></li>
                    <ol>
                        <li id="settings-alarm-activity">Activity</li>
                    </ol>
                    <li><h4>Post</h4></li>
                    <ol>
                        <li id="settings-post-interaction">Interaction</li>
                    </ol>
                </ol>
            </ol>
            <button type="button" id="settings-back-btn" class="theme">&lang; BACK</button>
        </div>
        <div id="settings-cont">
            this is settings.
        </div>
    </main>
</body>

<script>

	$(document).ready(function() {
	    $('#settings-menu label li > h2').css('color', 'grey');
	});
	
	$('#settings-menu label').on('click', function() {
	    let cur = $(this).find('h2').text().toLowerCase()
	    let flag = settingsMenuSwitch($('#settings-menu').find(`ol[id$=\${cur}]`));
	    if (flag.value == 0) {
	        $(this).find('h2').css('color', 'grey');
	        flag.tag.css('display', 'none');
	    } else {
	        $(this).find('li > h2').css('color', '');
	        flag.tag.css('display', 'block');
	    }
	});
	
	function settingsMenuSwitch(flag) {
	    if (flag.find('input[type="hidden"]').val() == 0) {
	        flag.find('input[type="hidden"]').val(1);
	    } else {
	        flag.find('input[type="hidden"]').val(0);
	    }
	    return {
	        value : flag.find('input[type=hidden]').val(),
	        tag : flag
	    };
	}
	
	$('#settings-menu li[id^="settings"]').on('click', function() {
	    let pageName = $(this).attr('id').replaceAll('-','_');
	    $.ajax({
	    	url: 'settings_load.do',
	    	type: 'post',
	    	data: {
	    		page : pageName
	    	},
	    	dataType: 'html',
	    	success: function(result) {
	    		$('#settings-cont').html(result);
	    	}
	    });
	});
	
	$('#settings-back-btn').on('click', function() {
        location.href="/sns/main";
    });
    
</script>
</html>