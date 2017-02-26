<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="/js/jquery-3.1.1.min.js"></script>
	<script> 
	    //Adding amount info to Subtotal info
		function add_subtotal(item){
			var amountID = $(item).attr('id');
			var current = parseFloat(document.getElementById(amountID).value);
			document.getElementById('amount').value = current.toFixed(2);
			document.getElementById('subtotal1').value = current.toFixed(2);
			document.getElementById('subtotal2').value = current.toFixed(2);
			document.getElementById('total').value = current.toFixed(2);
			document.getElementById('final_cost').value = current.toFixed(2);
			document.getElementById('initial_charge').value = current.toFixed(2);	
		}
		
		function refund(){
	    		var zero = "0";
	    		var refund = document.getElementById('total_refund').value;
	    		var total = document.getElementById('total').value;
 	    		var initial = document.getElementById('initial_charge').value;
			var final = document.getElementById('final_cost').value;
	    		if (Number(refund) > Number(zero) && Number(refund) < Number(initial)) {
	    			document.getElementById('final_cost').value = (initial - refund).toFixed(2);
	    			document.getElementById('total').value = (initial - refund).toFixed(2);
	    			document.getElementById('subtotal2').value = initial.toFixed(2);
	    			document.getElementById('total_refund').value = parseFloat(refund).toFixed(2);
	    		} else if (Number(refund) > Number(initial)) {
	    			alert ("I don't think you can refund that much. Double check the values.");
	    			document.getElementById('total_refund').value = "0.00";
	    		}
	    	}
	</script> 
	<style>
		table.upper td {
			text-align:left; 
			width:50%; 
		}
		#payment_source, #trans_date {
			width:100%;
		}
	</style>
</head>

<body>
	<form name="deposit_receipt" method="post" class="form-inline" target="_blank">
	
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
	
	<div style='margin-left:30%'>
		<h1><strong>Deposit Receipt &nbsp;</strong>
		<input class="form-control" type="text" name="ticketid" placeholder="ticket ID or chat ID" title="Ticket or Chat ID the request came from" required></h1><br/>
	</div>
	
	<div class="container">
		<div class="row">
			<div class="col-sm-5">
				<table class="upper">
					<tr>
						<td><b>Transaction Date </b></td>
						<td><input class="form-control" type="text" name="trans_date" id="trans_date" placeholder="mm/dd/yyyy" title="The date when transaction happened in format: mm/dd/yyyy" required></td></tr>
					<tr>
						<td><b>Transaction ID </b></td>
						<td><input class="form-control"  type="text" name="trans_id" placeholder="deposit transaction ID" title="Namecheap Transaction ID" required></td>
					</tr>
					<tr>
						<td><b>User Name </b></td>
						<td><input class="form-control"  type="text" name="username" placeholder="account username" title="Namecheap.com account username" required></td>
					</tr>
					<tr>
						<td><b>Address </b></td>
						<td><input class="form-control" type="text" name="name" placeholder="first and last name" title="Client's first and last name" required></td>
					</tr>			
					<tr>
						<td></td>
						<td><input class="form-control" type="text" name="address" placeholder="street address" title="street name and house number" required></td>
					</tr>
					<tr>
						<td></td>
						<td><input class="form-control" type="text" name="city" placeholder="city" title="name of the city" required></td>
					</tr>
					<tr>
						<td></td>
						<td><input class="form-control" type="text" name="state" placeholder="state" title="state name" size="6" required><input class="form-control" type="textarea" name="zipcode" placeholder="zip code" title="postal code" size="6" required></td>
					</tr>
					<tr>
						<td></td>
						<td><input class="form-control" type="text" name="country" placeholder="Country Code" title="country abbreviation" required></td>
					</tr>
					<tr>
						<td><b>VAT Number </b></td>
						<td><input class="form-control" type="text" name="vat_number" placeholder="VAT Number" title="Optional field. Skip if VAT not needed"></td>
					</td>
				</table>	
			</div>
			<div class="col-sm-5">
				<table class="upper">
					<tr>
						<td><b>Payment Source </b></td> 
						<td><select name="payment_source" id="payment_source" class="form-control"> 	
							<option name="Credit Card" value="Credit Card">Credit Card</option>
							<option name="PayPal" value="PayPal">PayPal</option>
							<option name="Dwolla" value="Dwolla">Dwolla</option>
							<option name="Bitcoin" value="Bitcoin">Bitcoin</option>
				    		</select></td>
				    	</tr>
				    	<tr>
				    		<td><b>Initial Charge </b></td>
				    		<td><input class="form-control" type="text" name="initial_charge" id="initial_charge" placeholder="X.XX" pattern="^\d+([.]\d{2})?$" title="Total amount of the deposit. Format X.XX without $ sign, decimals separated by ." required></td>
				    	</tr>
				    	<tr>
				    		<td><b>Final Cost </b></td>
				    		<td><input class="form-control" type="text" name="final_cost" id="final_cost" placeholder="X.XX" pattern="^\d+([.]\d{2})?$" title="Total amount of the deposit minus refunded amount (if refunded). Format X.XX without $ sign, decimals separated by ." required></td>
				    	</tr>
				    	<tr>
				    		<td><b>Total Refund </b></td>
				    		<td><input class="form-control" type="text" name="total_refund" id="total_refund" value="0.00" title="Refunded amount" onblur="refund()" required></td>
				    	</tr>
				    	<tr>
				    		<td><b>Refund Transaction ID </b></td>
				    		<td><input class="form-control" type="text" name="refund_trans_id" value="N/A" title="Namecheap refund transaction ID" required></td>
				    	</tr>
				    	<tr>
				    		<td><b>Refunded To </b></td>
				    		<td><input class="form-control" type="text" name="refunded_to" value="N/A" title="PP email, CC last 4 digits, BTC address, Dwolla email" required></td>
				    	</tr>
				</table>   
			</div> 
		</div>
		<div class="row">
			<br/><br/>
			<div id="productsdiv" style="text-align:left; width:80%">
				<table class="table table-striped" id="products" border="0">
					<tr>
						<td style="text-align:center; width:60%" bgcolor="#d9d9d9"><b>Type</b></td>
						<td style="text-align:center; width:20%" bgcolor="#d9d9d9"><b>Amount</b></td>
						<td style="text-align:center; width:20%" bgcolor="#d9d9d9"><b>Subtotal</b></td>
					</tr>
					<tr>
						<td><input type="text" style="text-align:center; font-weight:bold; width:100%" value="Deposit" name="type" readonly/></td>
						<td><input type="text" style="text-align:center; width:100%" placeholder="X.XX" pattern="^\d+([.]\d{2})?$" title="Deposit amount. Format X.XX without $ sign, decimals separated by ." name="amount" id="amount" onblur="add_subtotal(this)" required></td>
						<td><input style="width:100%; text-align:center;" type="text" placeholder="X.XX" pattern="^\d+([.]\d{2})?$" title="Deposit amount. Format X.XX without $ sign, decimals separated by ." name="subtotal1" id="subtotal1" required></td>
					</tr>
					<tr>
						<td style="text-align:right" colspan="2"><b>Subtotal &nbsp;</b></td>
						<td><input style="text-align:center; font-weight:bold; width:100%;" type="text" placeholder="X.XX" pattern="^\d+([.]\d{2})?$" title="Deposit amount. Format X.XX without $ sign, decimals separated by ." name="subtotal2" id="subtotal2" required></td>
					</tr>
					<tr>
						<td style="text-align:right" colspan="2"><b>Total &nbsp;</b></td>
						<td><input style="text-align:center; font-weight:bold; width:100%;" type="text" placeholder="X.XX" pattern="^\d+([.]\d{2})?$" title="Deposit amount. Format X.XX without $ sign, decimals separated by ." name="total" id="total" required></td>
					</tr>
				</table>
			</div>
			
		</div>
			
		<div style='margin-left:35%'>						
			<input type="hidden" name="form_id" value="deposit_receipt"><br/>
			<button type="submit" class="btn btn-default btn-lg"><img src="/img/gusenitca.gif" width="150px" height="80px" alt="Submit"></button>
		</div>		
	</form>
	</div>
</body>
</html>