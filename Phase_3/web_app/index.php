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

					<form id="insertMember">
						<h3>Insert Band Member</h3>
						<p>Add a band member to a band.</p>
						
						<label>Band Name</label>
						<input type="text" placeholder="Band Name" name="band_name" id="band_name" required>
						
						<label>Band Start</label>
						<input type="date" placeholder="Band Start" name="band_start_date" id="band_start_date" required>
						
						<label>Person Name</label>
						<input type="text" placeholder="Person Name" name="person_name" id="person_name" required>
						
						<label>Birthdate</label>
						<input type="date" placeholder="Birthdate" name="person_birthdate" id="person_birthdate" required>
						
						<label>Member Start Date</label>
						<input type="date" placeholder="Member Start Date" name="member_start_date" id="member_start_date" required>
						
						<label>Member End</label>
						<input type="date" placeholder="Member End Date" name="member_end_date" id="member_end_date">
						
						<input type="submit" value="Insert Member">
					</form>

					<form id="tourDate">
						<h3>Get Touring Members</h3>
						<p>Gets all people that have been on tour after a specified date.</p>
						
						<label>Start Date</label>
						<input type="date" placeholder="Start Date" name="start_date" id="start_date" required>
						
						<input type="submit" value="Get Members">
					</form>

					<form id="ageMember">
						<h3>Get Oldest/Youngest Member</h3>
						<p>Gets the oldest or the youngest member in the database.</p>
						<div class="row">
							<div class="col-sm-12"><input type="radio" name="input" value="youngest"><span class="radio-label">Youngest</span></div>
							<div class="col-sm-12"><input type="radio" name="input" value="oldest"><span class="radio-label">Oldest</span></div>
							</div>
						<input type="submit" value="Get Member">
					</form>

					<form id="billboardMembers">
						<h3>Billboard Members</h3>
						<p>Get all members that have produced a track that was rated a certain rating on the billboards.</p>
						<div class="row">
							<div class="col-sm-12">Rating: <input type="number" name="input" min="0" max="5000" step="100"></div>
						</div>
						<input type="submit" value="Get Members">
					</form>

					<form id="bigBands">
						<h3>Big/Small Bands</h3>
						<p>Get bands that are bigger or smaller than 10 members</p>
						<div class="row">
							<div class="col-sm-12"><input type="radio" name="input" value="large">Big</div>
							<div class="col-sm-12"><input type="radio" name="input" value="small">Small</div>
							</div>
						<input type="submit" value="Get Bands">
					</form>

				</div>
				<div class="results-window col-sm-6">
					<h3>Responses from Query</h3>
					<pre id="responseContent"></pre>
				</div>
			</div>
		</div>
		<div class="container disclaimer"><p>*Information is randomly generated. An effort was made to prevent inappropriate entries. Any instance of inappropriate names is unintentional.</p></div>
	</section>
	<div id="loading">
			<h3>Running Query</h3>
		<img src="https://media.giphy.com/media/Vuw9m5wXviFIQ/giphy.gif">
	</div>
</body>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="main.js"></script>
</html>