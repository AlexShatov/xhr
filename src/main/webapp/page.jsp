<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <script src="http://code.jquery.com/jquery-3.4.1.js"></script>
    <title>Page</title>
  </head>
  <body>
    <h2>Click!</h2>
    <form id="form" action="/xhr-0.0.1/" accept-charset=utf-8>
      <input id="value" type="text" name="value"/>
      <input id="secondvalue" type="text" name="value"/>
      <input type="button" value="Get Data" onclick="getData()">
    </form>
    <script  type="text/javascript">
    function getData() {
    	$.ajax({    
            url: $("#form").attr('action'),
            data: JSON.stringify({
        	  		property: document.getElementById('value').value,
        	  		oneMoreProperty: document.getElementById('secondvalue').value
            	  }),
            type: 'POST',
            contentType: "application/json; charset=utf-8",
            dataType: 'json',
            success: function(data){
                    document.getElementById('value').value = data.property;
                    document.getElementById('secondvalue').value = data.oneMoreProperty;
            }
        });
    }
    </script>
  </body>
</html>