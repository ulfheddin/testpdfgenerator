<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="/js/jquery-3.1.1.min.js"></script>
	
	<script type="text/javascript">				
		//Duplicating source of Payment
		function addSource(item){
			var amountID = $(item).attr('id');
			var current = document.getElementById(amountID).value;
			document.getElementById("payment_source1").value = current;
			document.getElementById("refunded_to").value = current;	
		}
		
		//Editing source of Payment
		function editSource(item){
			var amountID = $(item).attr('id');
			var current = document.getElementById(amountID).value;
			document.getElementById("payment_source").value = current;
		}
		//Adding amount info
		function addTotal(item){
			var amountID = $(item).attr('id');
			var current = parseFloat(document.getElementById(amountID).value);
			document.getElementById('initial_total').value = current.toFixed(2);
			document.getElementById('refund_total').value = current.toFixed(2);		
		}
		function addRefund(item){
			var amountID = $(item).attr('id');
			var current = parseFloat(document.getElementById(amountID).value);
			document.getElementById('refund_total').value = current.toFixed(2);		
		}					  		
	</script>
	<style>
		table.upper td {
			text-align: left; 
			width: 50%; 
		}
	</style>	
</head>

<body>
	<form name="refund_confirmation" method="post" class="form-inline" target="_blank">
	
	<div class="container">
		<div class="row">
			<div class="col-sm-5">
				<img src="/img/nclogo.png" width="300" height="90" alt="namecheap_logo"><br/><br/><br/><br/>
			</div>
			<div class="col-sm-5">
				<p>Namecheap.com<br/>
				4600 East Washington Street. Suite 305<br/>
				Phoenix, AZ 85034<br/>
				USA<br/>
				www.namecheap.com<br/>
				support@namecheap.com</p>
			</div>
		</div>
	</div>
	
	<div style='margin-left:25%'>
		<h1><b>Refund Confirmation &nbsp;</b>
		<input class="form-control" type="textarea" name="ticketid" placeholder="ticket ID or chat ID" title="Ticket or Chat ID the request came from"></h1><br/>		
	</div>
	
	
	<div class="container">
		<p>This is a refund confirmation of the transaction <input class="form-control" type="text" name="trans_id" size="10" placeholder="Transaction ID" title="Namecheap Transaction ID"> to the source of payment: <input class="form-control" type="text" name="payment_source" id="payment_source" placeholder="XXXX-XXXX-XXXX-1234" value="XXXX-XXXX-XXXX-1234" title="CC Last 4 Digits, PayPal Email, BTC address, Dwolla email" onblur="addSource(this)">.</p>
		<div class="row">
			<div class="col-sm-5">			
				<p>Please check the details below:</p>
				<table class="upper">
					<tr>
						<td><b>User Name </b></td>
						<td><input class="form-control" type="text" name="username" placeholder="account username" title="Namecheap.com account username"></td>
					</tr>
					<tr>
						<td><b>Address </b></td>
						<td><input class="form-control" type="text" name="name" placeholder="first and last name" title="Client's first and last name"></td>
					</tr>
					<tr>
						<td></td>
						<td><input class="form-control" type="text" name="address" placeholder="street address" title="street name and house number"></p>
					</tr>
					<tr>
						<td></td>
						<td><input class="form-control" type="text" name="city" placeholder="city" title="name of the city"></td>
					</tr>
					<tr>
						<td></td>
						<td><input class="form-control" type="text" name="state" placeholder="state" title="state name" size="6"><input class="form-control" type="text" name="zipcode" placeholder="zip code" title="postal code" size="6"></td>
					</tr>
					<tr>
						<td></td>
						<td><input class="form-control" type="text" name="country" placeholder="Country Code" title="country abbreviation"></td>
					</tr>
					<tr>
						<td><b>Payment Source </b></td>
						<td><input class="form-control" type="text" name="payment_source1" id="payment_source1" placeholder="XXXX-XXXX-XXXX-1234" value="XXXX-XXXX-XXXX-1234" title="CC Last 4 Digits, PayPal Email, BTC address, Dwolla email"></td>
					</tr>
					<tr>
						<td><b>Refunded To </b></td>
						<td><input class="form-control" type="text" name="refunded_to" id="refunded_to" placeholder="XXXX-XXXX-XXXX-1234" value="XXXX-XXXX-XXXX-1234" title="CC Last 4 Digits, PayPal Email, BTC address, Dwolla email" onblur="editSource(this)"></td>
					</tr>
					<tr>
						<td><b>VAT Number </b></td>
						<td><input class="form-control" type="text" name="vat_number" placeholder="VAT Number" title="Optional field. Skip if VAT not needed"></td>
					</tr>
				</table>	
			</div>
		</div>
	</div>			
	<br/>

		
	<div id="productsdiv" style='margin-left:18%; margin-right:35%'>
		 <table id="purchaseItems" name="purchaseItems" class="table table-striped" align="center" border="0">
			<tr>
			        <th style="text-align:center" bgcolor="#d9d9d9">Type</th>
			        <th style="text-align:center" bgcolor="#d9d9d9">Transaction ID</th>
			        <th style="text-align:center" bgcolor="#d9d9d9">Date</th>
			        <th style="text-align:center" bgcolor="#d9d9d9">Total Amount</th>
			</tr>
			<tr>
			        <td>
			        	<p size="45%"><b>Transaction ID</b></p>
			        </td>
			        <td>
			        	<input size="40%" style="text-align:center;" type="text" name="initial_transaction" placeholder="Initial Transaction" title="Purchase/Deposit Transaction ID" class="form-control" id="initial_transaction">
			        </td>
			        <td>
					<input size="10%" style="text-align:center;" placeholder="mm/dd/yyyy" type="text" name="initial_date" id="initial_date" title="Date of initial order/deposit" class="form-control">
			        </td>
			        <td>
			        	<input size="10%" style="text-align:center;" type="text" class="form-control" name="initial_total" id="initial_total" placeholder="X.XX" pattern="^\d+([.]\d{2})?$" title="Format X.XX without $ sign, decimals separated by ." onblur="addTotal(this)">
			        </td>
		       </tr>
		       <tr>
		       		<td>
		       			<p size="45%"><b>Refund Transaction ID</b></p>
		       		</td>
		       		<td>
		       			<input size="40%" style="text-align:center;" type="text" name="refund_transaction" placeholder="Refund Transaction" title="Purchase/Deposit Refund Transaction ID" class="form-control" id="refund_transaction">
		       		</td>
		       		 <td>
			        	<input size="10%" style="text-align:center;" placeholder="mm/dd/yyyy" type="text" name="refund_date" id="refund_date" title="Date when refund was issued" class="form-control" class="span2">			        	
			        </td>
			        <td>
			        	<input size="10%" style="text-align:center;" type="text" class="form-control" name="refund_total" id="refund_total" placeholder="X.XX" pattern="^\d+([.]\d{2})?$" title="Format X.XX without $ sign, decimals separated by ." onblur="addRefund(this)">
			        </td>
		       </tr>
		  </table>
	</div></div>
	
	<div style='margin-left:35%;'>						
		<input type="hidden" name="form_id" value="refund_confirmation"><br/>
		<button type="submit" class="btn btn-default btn-lg"><img src="/img/gusenitca.gif" width="150px" height="80px" alt="Submit"></button>
	</div>
	</form>	
</body>
</html>