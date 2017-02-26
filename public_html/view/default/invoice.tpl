<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="/js/jquery-3.1.1.min.js"></script>

	<script>		
		//Setting input names after table row generation
		function myAddRow() {
			var table = document.getElementById("purchaseItems");
			var len = table.rows.length;
			var row = table.insertRow(-1);
			var cell1 = row.insertCell(0);
			var cell2 = row.insertCell(1);
			var cell3 = row.insertCell(2);
			var cell4 = row.insertCell(3);
			var cell5 = row.insertCell(4);
			var cell6 = row.insertCell(5);
			var cell7 = row.insertCell(6);
			var cell8 = row.insertCell(7);
			cell1.innerHTML = '<select name="type" id="test" class="form-control" style="text-align:center; width:100%;" required><option name="register" value="REGISTER">REGISTER</option><option name="renew" value="RENEW">RENEW</option><option name="redemption" value="REDEMPTION">REDEMPTION</option><option name="transfer" value="TRANSFER">TRANSFER</option><option name="purchase" value="PURCHASE">PURCHASE</option></select>'; 
			var inp1 = cell1.getElementsByTagName('select')[0];
			inp1.name += len;
			inp1.value = 'REGISTER';
			cell2.innerHTML = '<input style="text-align:center; width:100%;" type="text"  name="product" placeholder="domain.com" class="form-control" required>';
			var inp2 = cell2.getElementsByTagName('input')[0];
			inp2.name += len;
			inp2.value = '';
			cell3.innerHTML = '<input name="quantity" id="quantity" class="form-control" style="text-align:center; width:100%;" value="1" size="4" onblur="add_subtotal(this); Icann(this);" required>';
			var inp3 = cell3.getElementsByTagName('input')[0];
			inp3.name += len;
			inp3.id += len;
			inp3.value = '1';
			cell4.innerHTML = '<select name="duration" id="duration" onClick="add_subtotal(this); Icann(this);" class="form-control" style="text-align:center; width:100%;" required><option selected="selected" name="dur1" value="1 year">1 year</option><option name="dur2" value="2 years">2 years</option><option name="dur3" value="3 years">3 years</option><option name="dur4" value="4 years">4 years</option><option name="dur5" value="5 years">5 years</option><option name="dur6" value="6 years">6 years</option><option name="dur7" value="7 years">7 years</option><option name="dur8" value="8 years">8 years</option><option name="dur9" value="9 years">9 years</option><option name="dur10" value="10 years">10 years</option></select>';
			var inp4 = cell4.getElementsByTagName('select')[0];
			inp4.name += len;
			inp4.id += len;
			inp4.value = '1 year';
			cell5.innerHTML = '<input style="text-align:center; width:100%;" type="text" size="4" name="price" id="price" placeholder="X.XX" title="Format X.XX without $ sign, decimals separated by ." class="form-control" onblur="add_subtotal(this)" required><br/><p text-align="left"><b>ICANN Fee:</b></p><div class="material-switch pull-right"><input class="checkbox" id="icann" name="icann" type="checkbox" onclick="Icann(this)" hidden/><label for="icann" class="label-info" title="Tick if this TLD goes along with ICANN Fee"></label></div>';
			var inp5 = cell5.getElementsByTagName('input')[0];
			inp5.name += len;
			inp5.id += len;
			inp5.value = '';
			var inp51 = cell5.getElementsByClassName('checkbox')[0];
			inp51.name += len;
			inp51.id += len;	    
			var inp52 = cell5.getElementsByClassName('label-info')[0];
			inp52.htmlFor += len;
			cell6.innerHTML = '<input style="text-align:center; width:100%;" type="text" size="4" name="subtotal" id="subtotal" placeholder="X.XX" class="form-control"><br/><br/><input style="text-align:center; width:100%;" type="text" size="4" name="fee" id="fee" placeholder="X.XX" class="form-control" required>';
			var inp6 = cell6.getElementsByTagName('input')[0];
			inp6.name += len;
			inp6.id += len;
			inp6.value = '';
			var inp6 = cell6.getElementsByTagName('input')[1];
			inp6.name += len;
			inp6.id += len;
			inp6.value = '0.00';
			cell7.innerHTML = '<input type="button" name="addRow" class="addRow" onclick="myAddRow()">';
			var inp7 = cell7.getElementsByTagName('input')[0];
			inp7.name += len;
			inp7.value = '+';
			cell8.innerHTML = '<input type="button" name="removeRow" class="removeRow" onclick="deleteRow(this)">';
			var inp8 = cell8.getElementsByTagName('input')[0];
			inp8.name += len;
			inp8.value = '-';
			//Filling hidden input
			countRows ();
		}
		
		function deleteRow(row)	{
			var i=row.parentNode.parentNode.rowIndex;
			if ($('#purchaseItems .addRow').length > 1) {
				 document.getElementById('purchaseItems').deleteRow(i);
			}
			countRows ();
		}
		
		function countRows (){
			var table = document.getElementById("purchaseItems");
		    	var len = table.rows.length;
		    	var len2 = document.getElementById("RowsCount");
		    	len2.value = len;
		}
		
		//Adding amount info to Subtotal info
		function add_subtotal(item){
			var itemID = $(item).attr('id');
			var subtotal = "subtotal" + itemID.match(/\d+/);
			var duration = "duration" + itemID.match(/\d+/);
			var durationvalue = (document.getElementById(duration).value).match(/\d+/);
			var price = "price" + itemID.match(/\d+/);
			var pricevalue = parseFloat(document.getElementById(price).value);
			var quantity = "quantity" + itemID.match(/\d+/);
			var quantityvalue = document.getElementById(quantity).value;
			document.getElementById(subtotal).value = (pricevalue * durationvalue * quantityvalue).toFixed(2);
			document.getElementById(price).value = pricevalue.toFixed(2);
			add_total();
		}
		
		//Count total
		function add_total(){
			var i = 1;
			var total_cost = 0;
			var table = document.getElementById("purchaseItems");
			var len = table.rows.length;
			for (i=1; i < len; i++){
				var subtotal = "subtotal" + i;
				var fee = "fee" + i;
				var current1 = document.getElementById(subtotal).value;
				var current2 = document.getElementById(fee).value;
				total_cost = parseFloat(total_cost) + parseFloat(current1) + parseFloat(current2);
			}
			document.getElementById('total').value = total_cost.toFixed(2);	
			document.getElementById('final_cost').value = total_cost.toFixed(2);			
		}
		   	
		//Counting values
	    	function Icann(item){
	    		var cost = 0.18;			
			var checkboxID = $(item).attr('id');
			var fee = "fee" + checkboxID.match(/\d+/);
			var icann = "icann" + checkboxID.match(/\d+/);
			var icannitem = document.getElementById(icann);
			var duration = "duration" + checkboxID.match(/\d+/);
			var durationvalue = (document.getElementById(duration).value).match(/\d+/);
			var quantity = "quantity" + checkboxID.match(/\d+/);
			var quantityvalue = document.getElementById(quantity).value;
		        if(icannitem.checked){
		       		document.getElementById(fee).value = (cost * durationvalue * quantityvalue).toFixed(2);
		        }else{
		        	document.getElementById(fee).value = (0.00).toFixed(2);
		        }
		        add_total();		        
	    	}
	</script>
	<style>
		table.upper td {
			text-align: left; 
			width: 50%; 
		}
		#payment_source {
			width:100%;
		}
		input.addRow {
		    -moz-border-radius: 4px;
		    border-radius: 4px;
		    background-color: #6FFF5C;
		    -moz-box-shadow: 0 0 4px rgba(0, 0, 0, .75);
		    box-shadow: 0 0 4px rgba(0, 0, 0, .75);
		    text-align: center;
		}
		input.addRow:hover {
		    background-color:#1EFF00;
		    -moz-border-radius: 4px;
		    border-radius: 4px;
		}
		input.removeRow {
		    -moz-border-radius: 4px;
		    border-radius: 4px;
		    background-color:#FFBBBB;
		    -moz-box-shadow: 0 0 4px rgba(0, 0, 0, .75);
		    box-shadow: 0 0 4px rgba(0, 0, 0, .75);
		    text-align: center;
		}
		input.removeRow:hover {
		    background-color:#FF0000;
		    -moz-border-radius: 4px;
		    border-radius: 4px;
		}

		.material-switch > input[type="checkbox"] {
		    display: none;   
		}
		
		.material-switch > label {
		    cursor: pointer;
		    height: 0px;
		    position: relative; 
		    width: 40px;  
		}
		
		.material-switch > label::before {
		    background: rgb(0, 0, 0);
		    box-shadow: inset 0px 0px 10px rgba(0, 0, 0, 0.5);
		    border-radius: 8px;
		    content: '';
		    height: 16px;
		    margin-top: -8px;
		    position:absolute;
		    opacity: 0.3;
		    transition: all 0.4s ease-in-out;
		    width: 40px;
		}
		.material-switch > label::after {
		    background: rgb(255, 255, 255);
		    border-radius: 16px;
		    box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.3);
		    content: '';
		    height: 24px;
		    left: -4px;
		    margin-top: -8px;
		    position: absolute;
		    top: -4px;
		    transition: all 0.3s ease-in-out;
		    width: 24px;
		}
		.material-switch > input[type="checkbox"]:checked + label::before {
		    background: inherit;
		    opacity: 0.5;
		}
		.material-switch > input[type="checkbox"]:checked + label::after {
		    background: inherit;
		    left: 20px;
	</style>
</head>

<body>
	<form name="invoice" method="post" class="form-inline" target="_blank">
	
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
	
	<div style='margin-left:35%'>
		<h1><b>Invoice &nbsp;</b>
		<input class="form-control" type="text" name="ticketid" placeholder="ticket ID or chat ID" title="Ticket or Chat ID the request came from" required></h1><br/>
	</div>
	
	<div class="container">
		<div class="row">
			<div class="col-sm-5">		
				<table class="upper">
					<tr>
						<td><b>User Name </b></td>
						<td><input class="form-control" type="text" name="username" placeholder="account username" title="Namecheap.com account username" required></td>
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
						<td><input class="form-control" type="text" name="state" placeholder="state" title="state name" size="6" required><input class="form-control" type="text" name="zipcode" placeholder="zip code" title="postal code" size="6" required></td>
					</tr>
					<tr>
						<td></td>
						<td><input class="form-control" type="text" name="country" placeholder="Country Code" title="country abbreviation" required></td>
					</tr>
					<tr>
						<td><b>VAT Number </b></td>
						<td><input class="form-control" type="text" name="vat_number" placeholder="VAT Number" title="Optional field. Skip if VAT not needed" required></td>
					</tr>
				</table>	
			</div>
			<div class="col-sm-5">
				<table class="upper">
					<tr>
						<td><b>Payment Source </b></td>
						<td><select name="payment_source" id="payment_source" class="form-control" required> 	
							<option name="Credit Card" value="Credit Card">Credit Card</option>
							<option name="PayPal" value="PayPal">PayPal</option>
							<option name="Dwolla" value="Dwolla">Dwolla</option>
							<option name="Bitcoin" value="Bitcoin">Bitcoin</option>
					    	</select></td>
				    	</tr>
				    	<tr>				
						<td><b>Final Cost </b></td>
						<td><input class="form-control" type="text" name="final_cost" id="final_cost" placeholder="X.XX" pattern="^\d+([.]\d{2})?$" title="Total amount of the order. Format X.XX without $ sign, decimals separated by ." required></td>
					</tr>
				</table>
			</div> 
		</div>
		<br/><br/>

		<div class="row">
			<div id="productsdiv" style="width:80%;" align="center">
				<table id="purchaseItems" name="purchaseItems" class="table table-striped" align="center" border="0">
					<tr>
						<th style="text-align:center" bgcolor="#d9d9d9">Type</th>
						<th style="text-align:center" bgcolor="#d9d9d9">Product</th>
						<th style="text-align:center" bgcolor="#d9d9d9">Qty</th>
						<th style="text-align:center" bgcolor="#d9d9d9">Duration</th>
						<th style="text-align:center" bgcolor="#d9d9d9">Price</th>
						<th style="text-align:center" bgcolor="#d9d9d9">Subtotal</th>
						<th style="text-align:center" bgcolor="#d9d9d9">&nbsp;</th>
						<th style="text-align:center" bgcolor="#d9d9d9">&nbsp;</th>
					</tr>
					<tr>
						<td><select name="type1" class="form-control" style="text-align:center; width:100%;" required> 	
							<option name="register" value="REGISTER">REGISTER</option>
							<option name="renew" value="RENEW">RENEW</option>
							<option name="redemption" value="REDEMPTION">REDEMPTION</option>
							<option name="transfer" value="TRANSFER">TRANSFER</option>
							<option name="purchase" value="PURCHASE">PURCHASE</option>
						</select></td>
						<td>
							<input style="text-align:center; width:100%" type="text"  name="product1" placeholder="domain.com" class="form-control" required>
						</td>
						<td>
							<input name="quantity1" id="quantity1" class="form-control" style="text-align:center; width:100%;" value="1" size="4" onblur="add_subtotal(this); Icann(this);" required>
						</td>
						<td>
							<select name="duration1" id="duration1" class="form-control" style="text-align:center; width:100%;" onClick="add_subtotal(this); Icann(this);" required> 	
								<option selected="selected" name="dur1" value="1 year">1 year</option>
								<option name="dur2" value="2 years">2 years</option>
								<option name="dur3" value="3 years">3 years</option>
								<option name="dur4" value="4 years">4 years</option>
								<option name="dur5" value="5 years">5 years</option>
								<option name="dur6" value="6 years">6 years</option>
								<option name="dur7" value="7 years">7 years</option>
								<option name="dur8" value="8 years">8 years</option>
								<option name="dur9" value="9 years">9 years</option>
								<option name="dur10" value="10 years">10 years</option>
							</select>
						</td>
						<td>
							<input style="text-align:center; width:100%;" type="text" size="4" name="price1" id="price1" placeholder="X.XX" pattern="^\d+([.]\d{2})?$" title="Format X.XX without $ sign, decimals separated by ." class="form-control" id="price1" onblur="add_subtotal(this)" required><br/>
							<p text-align="left"><b>ICANN Fee:</b></p>
							<div class="material-switch pull-right">
								<input id="icann1" name="icann1" type="checkbox" class="checkbox" value="0.18" onClick="Icann(this)" hidden/>
						                <label for="icann1" class="label-info" title="Tick if this TLD goes along with ICANN Fee"></label>
							</div>
						</td>
						<td>
							<input style="text-align:center; width:100%;" placeholder="X.XX" type="text" size="4" name="subtotal1" id="subtotal1" class="form-control" required><br/><br/>
							<input style="text-align:center; width:100%;" placeholder="X.XX" type="text" size="4" name="fee1" value="0.00" id="fee1" class="form-control" required>
						</td>
						<td>
							<input type="button" name="addRow" class="addRow" value='+' onclick="myAddRow()">
						</td>
						<td>
							<input type="button" name="removerowRow" class="removeRow" value='-' onclick="deleteRow(this)">
						</td>
					</tr>
				</table>
				<div style='text-align:right; margin-right:10%;'>
					<p><b>Total &nbsp;</b><input style="text-align:center; font-weight:bold;" type="text" size="4" class="form-control" name="total" id="total" placeholder="0.00" onblur="add_total()" required></p>
				</div>
			</div>
			
			<div style='margin-left:35%;'>						
				<input type="hidden" name="form_id" value="invoice"><br/>
				<input type="hidden" id="RowsCount" name="rowscount" value="2"><br/>
				<button type="submit" class="btn btn-default btn-lg"><img src="/img/gusenitca.gif" width="150px" height="80px" alt="Submit"></button>
			</div>
			</form>	
		</div>
</body>
</html>