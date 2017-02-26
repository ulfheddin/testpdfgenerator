<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="/js/jquery-3.1.1.min.js"></script>


<style>
	.login {
		text-align: center;
		width: 23%;
		height: 20%;
		margin-top: 5%;
		margin-left: 40%;
		margin-right: 10%;
		background-color: #000033;
		padding-bottom: 250px;
		padding-left: 50px;
		padding-right: 50px;
		padding-top: 50px;
		box-shadow: 10px 10px 5px #888888;

 	}
	#submit {
		width: 140px;
		height: 40px;
	}
	
	#submit{
		border:1px solid #4B546A;-webkit-box-shadow: #B7B8B8 0px 1px 0px inset;-moz-box-shadow: #B7B8B8 0px 1px 0px inset; box-shadow: #B7B8B8 0px 1px 0px inset; -webkit-border-radius: 3px; -moz-border-radius: 3px;border-radius: 3px;font-size:12px;font-family:arial, helvetica, sans-serif; padding: 10px 10px 10px 10px; text-decoration:none; display:inline-block;text-shadow: -1px -1px 0 rgba(0,0,0,0.3);font-weight:bold; color: #FFFFFF;
		 background-color: #606C88; background-image: -webkit-gradient(linear, left top, left bottom, from(#606C88), to(#3F4C6B));
		 background-image: -webkit-linear-gradient(top, #606C88, #3F4C6B);
		 background-image: -moz-linear-gradient(top, #606C88, #3F4C6B);
		 background-image: -ms-linear-gradient(top, #606C88, #3F4C6B);
		 background-image: -o-linear-gradient(top, #606C88, #3F4C6B);
		 background-image: linear-gradient(to bottom, #606C88, #3F4C6B);filter:progid:DXImageTransform.Microsoft.gradient(GradientType=0,startColorstr=#606C88, endColorstr=#3F4C6B);
	}
		
	#submit:hover{
		 border:1px solid #4B546A;
		 background-color: #4B546A; background-image: -webkit-gradient(linear, left top, left bottom, from(#4B546A), to(#2C354B));
		 background-image: -webkit-linear-gradient(top, #4B546A, #2C354B);
		 background-image: -moz-linear-gradient(top, #4B546A, #2C354B);
		 background-image: -ms-linear-gradient(top, #4B546A, #2C354B);
		 background-image: -o-linear-gradient(top, #4B546A, #2C354B);
		 background-image: linear-gradient(to bottom, #4B546A, #2C354B);filter:progid:DXImageTransform.Microsoft.gradient(GradientType=0,startColorstr=#4B546A, endColorstr=#2C354B);
	}

</style>
</head>
<body>
	<div class="login">
		<i class="glyphicon glyphicon-duplicate" text-align: "left"; style="font-size:36px; color: white;"></i>
		<hr><br/>
		<form method="post">
			<p><input class="form-control" type="text" name="username" id="username" placeholder="Username" required></p>
			<p><input class="form-control" type="password" name="password" id="password" placeholder="Password" required></p>
			<input type="hidden" name="form_id" value="log_admin">
			<button type="submit" id="submit"><b>Log In</b></button>
		</form>
	</div>
</body>

</html>