$(document).ready(onLoad);

function onLoad(){

	$("form").submit(function(e){
		$("#loading").show(400);
		e.preventDefault();
		var id = $(this).attr("id");

		switch(id){
			case "insertMember":
				insertMember( this );
				break;
			case "getBand":
				getBand( this );
				break;
			case "tourDate":
				tourDate( this );
				break;
			case "ageMember":
				ageMember( this );
				break;
			case "billboardMembers":
				billboardMembers( this );
				break;
			case "bigBands":
				bigBands( this );
				break;
		}
	});
}



function insertMember( form ){

	var data = $( form ).serialize();
	$.ajax({
		url : "api/insert_band_member.php?" + data,
		type: "GET",
		// data : data,

		success: function(data, textStatus, jqXHR) {
			var formatData = JSON.parse(data);
			updateResponse(formatData);
			setTimeout(function(){$("#loading").hide(400);},600);
		},
		error: function (jqXHR, textStatus, errorThrown) {
			updateResponse(errorThrown);
			setTimeout(function(){$("#loading").hide(400);},600);
		}
	});
}

function getBand( form ){

	var data = $( form ).serialize();
	$.ajax({
		url : "api/get_band_members.php?" + data,
		type: "GET",
		// data : data,

		success: function(data, textStatus, jqXHR) {
			var formatData = JSON.parse(data);
			updateResponse(formatData);
			setTimeout(function(){$("#loading").hide(400);},600);
		},
		error: function (jqXHR, textStatus, errorThrown) {
			updateResponse(errorThrown);
			setTimeout(function(){$("#loading").hide(400);},600);
		}
	});
}

function tourDate( form ){
	var data = $( form ).serialize();
	$.ajax({
		url : "api/select_bands_with_given_tour_date.php?" + data,
		type: "GET",
		// data : data,

		success: function(data, textStatus, jqXHR) {
			var formatData = JSON.parse(data);
			updateResponse(formatData);
			setTimeout(function(){$("#loading").hide(400);},600);
		},
		error: function (jqXHR, textStatus, errorThrown) {
			updateResponse(errorThrown);
			setTimeout(function(){$("#loading").hide(400);},600);
		}
	});
}

function ageMember( form ){
	var data = $( form ).serialize();
	$.ajax({
		url : "api/select_bands_with_oldest_or_youngest_member.php?" + data,
		type: "GET",
		//data : data,

		success: function(data, textStatus, jqXHR) {
			var formatData = JSON.parse(data);
			updateResponse(formatData);
			setTimeout(function(){$("#loading").hide(400);},600);
		},
		error: function (jqXHR, textStatus, errorThrown) {
			updateResponse(errorThrown);
			setTimeout(function(){$("#loading").hide(400);},600);
		}
	});
}

function billboardMembers( form ){
	var data = $( form ).serialize();
	$.ajax({
		url : "api/select_people_in_bands_with_songs_of_given_rating.php?" + data,
		type: "GET",
		//data : data,

		success: function(data, textStatus, jqXHR) {
			var formatData = JSON.parse(data);
			updateResponse(formatData);
			setTimeout(function(){$("#loading").hide(400);},600);
		},
		error: function (jqXHR, textStatus, errorThrown) {
			updateResponse(errorThrown);
			setTimeout(function(){$("#loading").hide(400);},600);
		}
	});
}


function bigBands( form ){
	var data = $( form ).serialize();
	$.ajax({
		url : "api/select_small_or_large_bands.php?" + data,
		type: "GET",
		//data : data,

		success: function(data, textStatus, jqXHR) {
			var formatData = JSON.parse(data);
			updateResponse(formatData);
			setTimeout(function(){$("#loading").hide(400);},600);
		},
		error: function (jqXHR, textStatus, errorThrown) {
			updateResponse(errorThrown);
			setTimeout(function(){$("#loading").hide(400);},600);
		}
	});
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
		    type: "GET",
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

function countTables() {
	$("#responseContent").html("");
	var tables = ["album", "band", "band_member", "concert", "featured_artist", "instrument", "person", "plays", "song", "staff", "tour"];
	for(var i = 0; i < tables.length; i++) {
		// SELECT COUNT(*) FROM `band`;	
		$.ajax({
		    url : "table_count.php",
		    type: "GET",
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
	$('html, body').animate({
        scrollTop: $("#responseContent").offset().top - 60
    }, 1000);
}