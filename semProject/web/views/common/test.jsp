<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  
  <script>
  $( function() {
    $( "#datepicker" ).datepicker();
    $( "#datepicker" ).datepicker( "option", "showAnim", "slideDown" );
    
  } );
  $( function() {
       $( "input" ).checkboxradio({
         icon: false
       });
     } );
  
  </script>
</head>
<body>
  <fieldset>
    <legend>Select a Location: </legend>
    <label for="radio-1">New York</label>
    <input type="radio" name="radio-1" id="radio-1">
    <label for="radio-2">Paris</label>
    <input type="radio" name="radio-1" id="radio-2">
    <label for="radio-3">London</label>
    <input type="radio" name="radio-1" id="radio-3">
  </fieldset>
 
<p>Date: <input type="text" id="datepicker" size="30"></p>
 
<p>Animations:<br>
  <select id="anim">
    <option value="show">Show (default)</option>
    <option value="slideDown">Slide down</option>
    <option value="fadeIn">Fade in</option>
    <option value="blind">Blind (UI Effect)</option>
    <option value="bounce">Bounce (UI Effect)</option>
    <option value="clip">Clip (UI Effect)</option>
    <option value="drop">Drop (UI Effect)</option>
    <option value="fold">Fold (UI Effect)</option>
    <option value="slide">Slide (UI Effect)</option>
    <option value="">None</option>
  </select>
</p>
 
 
</body>
</html>