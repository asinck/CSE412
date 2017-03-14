$(document).ready(onLoad);

function onLoad(){
	// on form submissions, send an ajax request and update with response.
	$("#submitInsertBand").click(insertBandQuery);
	$('#insert_enddate').keypress(function (e) {
	  if (e.which == 13) {
	    insertBandQuery();
	  }
	});
	$("#insert_enddate").submit(insertBandQuery);

	$("#submitGetBand").click(getBandQuery);
	$('#getBand').keypress(function (e) {
	  if (e.which == 13) {
	    getBandQuery();
	  }
	});

	// on simple query submit, ajax call to simple_query
	$("#submitQuery").click(customQuery);
	$('#query').keypress(function (e) {
	  if (e.which == 13) {
	    customQuery();
	  }
	});

	$("#countTables").click(countTables);
}

function insertBandQuery(){
	// clear last input
	$("#responseContent").html("");

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
}

function getBandQuery(){
	// clear last input
	$("#responseContent").html("");

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
}

function customQuery(){
	// clear last input
	$("#responseContent").html("");

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
}

function countTables() {
	$("#responseContent").html("");
	var tables = ["album", "band", "band_member", "concert", "featured_artist", "instrument", "person", "plays", "song", "staff", "tour"];
	for(var i = 0; i < tables.length; i++) {
		// SELECT COUNT(*) FROM `band`;	
		$.ajax({
		    url : "table_count.php",
		    type: "POST",
		    data : {query: "SELECT COUNT(*) FROM `" + tables[i] + "`;", table: tables[i]},
		    success: function(data, textStatus, jqXHR)
		    {
				data = JSON.parse(data);
				if(typeof data == "object") {
					var content = "";
					for(var i = 0; i < data.length; i++) {
						content += JSON.stringify( data[i] ) + "\n";
					}
					content = $("#responseContent").html() + content + "\n";
					$("#responseContent").html(content);
				}
				else {
					var content = data;
					content = $("#responseContent").html() + content;
					$("#responseContent").html(content);
				}
		    },
		    error: function (jqXHR, textStatus, errorThrown)
		    {
		 		updateResponse(errorThrown);
		    }
		});	
	}
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