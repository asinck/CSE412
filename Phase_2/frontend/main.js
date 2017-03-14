$(document).ready(onLoad);

function onLoad(){
	// on form submissions, send an ajax request and update with response.
	$("#submitInsertBand").click(function(){

		if( !$("#insert_bandname").val().length || !$("#insert_billboardrating").val().length || !$("#insert_startdate").val().length || !$("#insert_enddate").val().length )
			alert("not all fields filled in");
		else {
			formData = {bandname: $("#insert_bandname").val(), 
				billboardrating: $("#insert_billboardrating").val(), 
				startdate: $("#insert_startdate").val(), 
				enddate: $("#insert_enddate").val()};
			$.ajax({
			    url : "insert_band.php",
			    type: "POST",
			    data : formData,
			    success: function(data, textStatus, jqXHR)
			    {
					var formatData = JSON.parse(data);
					updateResponse(formatData);
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			 		updateResponse(errorThrown);
			    }
			});
		}
	});

	$("#submitGetBand").click(function(){
		if( !$("#getBand").val().length )
			alert("Type in a band name before query.");
		else {
			formData = {bandName: $("#getBand").val()};
			$.ajax({
			    url : "get_band.php",
			    type: "POST",
			    data : formData,
			    success: function(data, textStatus, jqXHR)
			    {
					var formatData = JSON.parse(data);
					updateResponse(formatData);
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			 		updateResponse(errorThrown);
			    }
			});			
		}
	});
	// on simple query submit, ajax call to simple_query
	$("#submitQuery").click(function(){

		formData = {query: $("#query").val()};
		$.ajax({
		    url : "simple_query.php",
		    type: "POST",
		    data : formData,
		    success: function(data, textStatus, jqXHR)
		    {
				var formatData = JSON.parse(data);
				updateResponse(formatData);
		    },
		    error: function (jqXHR, textStatus, errorThrown)
		    {
		 		updateResponse(errorThrown);
		    }
		});
	});
}

function updateResponse(response){
	if(typeof response == "object") {
		var content = "";
		for(var i = 0; i < response.length; i++) {
			content += JSON.stringify( response[i] ) + "\n";
		}
		$("#responseContent").html(content);
	}
	else {
		$("#responseContent").html(response);
	}
}