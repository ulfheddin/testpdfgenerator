<html>
<head>
	<meta charset="UTF-8">
	<style>
		ul {
			list-style-type: none;
			margin: 0;
			padding: 0;
			overflow: hidden;
			background-color: #333;
		}
		
		li {
			float: left;
		}
		
		li a {
			display: block;
			color: white;
			text-align: center;
			padding: 14px 16px;
			text-decoration: none;
		}
		
		li a:hover {
			background-color: #111;
			color: red;
			text-decoration: none;
		}

		li:last-child { 
			float:right; 
		}
		
		#submit {
			width: 140px;
			height: 47px;
		}
	
		#submit{
			position: absolute;
			right: 0px;
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
	<ul id="navbar">
		<li><a href="http://metodkabi.net/deposit_receipt" target="_self">Deposit Receipt</a></li>
		<li><a href="http://metodkabi.net/order_receipt" target="_self">Order Receipt</a></li>
		<li><a href="http://metodkabi.net/invoice" target="_self">Invoice</a></li>
		<li><a href="http://metodkabi.net/refund_confirmation" target="_self">Refund Confirmation</a></li>
		<li><form method="post" target="_self"><input type="hidden" name="form_id" value="end_session"><button type="submit" id="submit" style="align:right"><b>Log Out</b></button></form></li>
	</ul>
</body>
</html>