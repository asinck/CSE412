<!DOCTYPE HTML>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>CSE412 Project Demo</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  <link rel="stylesheet" href="style.css"/>
</head>

<body>
	<section class="main-content">
		<div class="container-fluid">
			<div class="row">
			<h1>CSE 412 Demo</h1>
				<div class="query-window col-sm-6">
				<h3>Run Query</h3>
					<div class="row">
						<div class="col-sm-6">
							<input type="text" name="insert_bandname" id="insert_bandname" placeholder="Band Name">
						</div>
						<div class="col-sm-6">
							<input type="number" name="insert_billboardrating" id="insert_billboardrating" placeholder="Band Billboard Rating">
						</div>
						<div class="col-sm-6">
							<input type="text" name="insert_startdate" id="insert_startdate" placeholder="Band Start Date">
						</div>
						<div class="col-sm-6">
							<input type="text" name="insert_enddate" id="insert_enddate" placeholder="Band End Date">
						</div>
						<div class="col-sm-12">
							<button class="btn" id="submitInsertBand">Insert Band</button>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-8">
							<input type="text" name="getBand" id="getBand" placeholder="Band Name">
						</div>
						<div class="col-sm-4">
							<button class="btn" id="submitGetBand">Get Band</button>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-8">
							<input type="text" name="query" id="query" placeholder="Custom Query">
						</div>
						<div class="col-sm-4">
							<button class="btn" id="submitQuery">Run Query</button>
						</div>
					</div>
				</div>
				<div class="results-window col-sm-6">
					<h3>Responses from Query</h3>
					<pre id="responseContent"></pre>
				</div>
			</div>
		</div>
	</section>
</body>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="main.js"></script>
</html>