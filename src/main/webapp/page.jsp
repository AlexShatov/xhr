<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Page</title>
  </head>
  <body>
    <h2>Click!</h2>
    <form id="form" accept-charset=utf-8>
      <input id="value" type="text" name="value"/>
      <input id="secondvalue" type="text" name="value"/>
      <input type="button" value="Get Data" onclick="getData()">
    </form>
    <script  type="text/javascript">
    function getData() {
        var xhr = new XMLHttpRequest();
        var json = JSON.stringify({
        	  property: document.getElementById('value').value,
        	  oneMoreProperty: document.getElementById('secondvalue').value
        	});
        xhr.open('POST', '/xhr-0.0.1/', true);
        xhr.setRequestHeader('Content-type', 'application/json; charset=utf-8');
        xhr.responseType = 'json';
        xhr.send(json); 
        xhr.onreadystatechange = function () {
        	if (xhr.readyState == 4){
        		var resp = xhr.response;
        		document.getElementById('value').value = resp.property;
        		document.getElementById('secondvalue').value = resp.oneMoreProperty;
        	}
        };	
    }
    </script>
  </body>
</html>