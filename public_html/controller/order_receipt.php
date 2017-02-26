<?php

//Working with Order Receipt (Multiple rows)
class ORDER extends FPDF	{
	
	function Header()
	{
		if ($this->page == 1) {
		    // Logo
		    $this->Image('img/gusenitca.png',10,14,75);
		    $this->SetFont('Arial','',12);
		    // Move to the right
		    $this->Cell(100);
		    // Namecheap Address
		    $this->Cell(45,5,'',0,0,'C'); $this->Ln(); $this->Cell(100);
		    $this->Cell(45,5,'',0,0,'C'); $this->Ln(); $this->Cell(101);
		    $this->Cell(45,5,'companyname',0,0,'C'); $this->Ln(); $this->Cell(123);
		    $this->Cell(45,5,'companyaddress',0,0,'C'); $this->Ln(); $this->Cell(103);
		    $this->Cell(45,5,'city',0,0,'C'); $this->Ln(); $this->Cell(90);
		    $this->Cell(45,5,'country',0,0,'C'); $this->Ln(); $this->Cell(106);
		    $this->Cell(45,5,'website URL',0,0,'C'); $this->Ln(); $this->Cell(110);
		    $this->Cell(45,5,'support page',0,0,'C'); $this->Ln();	   	    
	
		    // Line break
		    $this->Ln(20);
	       }
	}
	
	// Page footer
	function Footer()
	{
		$stop = 1;
		if ($stop != 1) {
		    // Position at 1.5 cm from bottom
		    $this->SetY(-15);
		    // Arial italic 8
		    $this->SetFont('Arial','I',8);
		    // Page number
		    $this->Cell(0,10,'Page '.$this->PageNo().'/{nb}',0,0,'C');
		}
	}
			
	var $widths;
	var $aligns;
	
	function SetWidths($w)
	{
	    //Set the array of column widths
	    $this->widths=$w;
	}
	
	function SetAligns($a)
	{
	    //Set the array of column alignments
	    $this->aligns=$a;
	}
	
	function Row($data)
	{
	    //Calculate the height of the row
	    $nb=0;
	    for($i=0;$i<count($data);$i++)
	        $nb=max($nb,$this->NbLines($this->widths[$i],$data[$i]));
	    $h=5.5*$nb;
	    //Issue a page break first if needed
	    $this->CheckPageBreak($h);
	    //Draw the cells of the row
	    for($i=0;$i<count($data);$i++)
	    {
	        $w=$this->widths[$i];
	        if ($i == 4 || $i == 5){
	        	$a = 'R';
	        } elseif ($i == 0) {
	        	$a='L';
	        } else {
		        $a=isset($this->aligns[$i]) ? $this->aligns[$i] : 'C';
		}
	        //Save the current position
	        $x=$this->GetX();
	        $y=$this->GetY();
	        //Draw the border
	        $this->Rect($x,$y,$w,$h);
	        //Print the text
	        $this->MultiCell($w,5.5,"$data[$i]",0,$a);
	        //Put the position to the right of the cell
	        $this->SetXY($x+$w,$y);
	    }
	    //Go to the next line
	    $this->Ln($h);
	}
	
	function BorderlessRow($data)
	{
	    //Calculate the height of the row
	    $nb=0;
	    for($i=0;$i<count($data);$i++)
	        $nb=max($nb,$this->NbLines($this->widths[$i],$data[$i]));
	    $h=7*$nb;
	    //Issue a page break first if needed
	    $this->CheckPageBreak($h);
	    //Draw the cells of the row
	    for($i=0;$i<count($data);$i++)
	    {
	        $w=$this->widths[$i];
	        $a=isset($this->aligns[$i]) ? $this->aligns[$i] : 'L';
	        //Save the current position
	        $x=$this->GetX();
	        $y=$this->GetY();
	        //Draw the border
	        //$this->Rect($x,$y,$w,$h);
	        //Print the text
	        $this->MultiCell($w,7,"$data[$i]",0,$a);
	        //Put the position to the right of the cell
	        $this->SetXY($x+$w,$y);
	    }
	    //Go to the next line
	    $this->Ln($h);
	}
	
	function CheckPageBreak($h)
	{
	    //If the height h would cause an overflow, add a new page immediately
	    if($this->GetY()+$h>$this->PageBreakTrigger)
	        $this->AddPage($this->CurOrientation);
	}
	
	function NbLines($w,$txt)
	{
	    //Computes the number of lines a MultiCell of width w will take
	    $cw=&$this->CurrentFont['cw'];
	    if($w==0)
	        $w=$this->w-$this->rMargin-$this->x;
	    $wmax=($w-2*$this->cMargin)*1000/$this->FontSize;
	    $s=str_replace("\r",'',$txt);
	    $nb=strlen($s);
	    if($nb>0 and $s[$nb-1]=="\n")
	        $nb--;
	    $sep=-1;
	    $i=0;
	    $j=0;
	    $l=0;
	    $nl=1;
	    while($i<$nb)
	    {
	        $c=$s[$i];
	        if($c=="\n")
	        {
	            $i++;
	            $sep=-1;
	            $j=$i;
	            $l=0;
	            $nl++;
	            continue;
	        }
	        if($c==' ')
	            $sep=$i;
	        $l+=$cw[$c];
	        if($l>$wmax)
	        {
	            if($sep==-1)
	            {
	                if($i==$j)
	                    $i++;
	            }
	            else
	                $i=$sep+1;
	            $sep=-1;
	            $j=$i;
	            $l=0;
	            $nl++;
	        }
	        else
	            $i++;
	    }
	    return $nl;
	}
	//Fancy table again
	function FancyTable($header, $data, $icann, $fee)
	{
	    // Colors, line width and bold font
	    $this->SetFillColor(128,128,128);
	    $this->SetTextColor(255);
	    $this->SetDrawColor(0,0,0);
	    $this->SetLineWidth(.3);
	    $this->SetFont('','');
	    // Header
	    $w = array(35, 65, 10, 25, 17, 30);
	    for($i=0;$i<count($header);$i++)
	        $this->Cell($w[$i],7,$header[$i],1,0,'C',true);
	    $this->Ln();
	    // Color and font restoration
	    $this->SetFillColor(224,235,255);
	    $this->SetTextColor(0);
	    $this->SetFont('Arial','',12);
	    // Data
	    $fill = false;
	    $this->SetWidths(array(35, 65, 10, 25, 17, 30));
	    $m = 1;
	    foreach($data as $row){		
		$this->Row($row);		
		if ($icann[$m] == 1){
			$this->Cell(152,6,"ICANN Fee: ",'1',0,'R',$fill);
			$this->Cell(30,6,"$fee[$m]",'1',0,'R',$fill); 
			$this->Ln();
		} else {}
		$m++;	
	    }
	}	
	
	function BorderlessTable($header, $data)
	{
	    // Colors, line width and bold font
	    $this->SetFillColor(128,128,128);
	    $this->SetTextColor(255);
	    $this->SetDrawColor(0,0,0);
	    $this->SetLineWidth(.3);
	    // Color and font restoration
	    $this->SetFillColor(224,235,255);
	    $this->SetTextColor(0);
	    $this->SetFont('Arial','',12);
	    // Data
	    $this->SetWidths(array(40, 65, 50, 60, ));
	    foreach($data as $row){
		$this->BorderlessRow($row);
	    }
	    // Closing line
	 //   $this->Cell(array_sum($w),0,'','T');
	}
}	

if ($_POST['form_id'] == "order_receipt"){
		$ticketid = $_POST['ticketid'];
		$filename = "Order Receipt ";
		$vat_number = $_POST['vat_number'];
		$subtotal = "$" . $_POST['initial_charge'];
		$total = "$" . $_POST['total'];
		$clientdata = array (
		array ("Order Date", ": " . $_POST['order_date'], "Payment Source", ": " . $_POST['payment_source']),
		array ("Order Number", ": " . $_POST['order_number'], "Initial Charge", ": " . "$" . $_POST['initial_charge']),
		array ("Transaction ID", ": " . $_POST['trans_id'], "Final Cost", ": " . "$" . $_POST['final_cost']),
		array ("Username", ": " . $_POST['username'], "Total Refund", ": " . "$" . $_POST['total_refund']),
		array ("Address", ": " . $_POST['name'], "Refund Transaction ID", ": " . $_POST['refund_trans_id']),
		array ("", "  " . $_POST['address'], "Refunded To", ": " . $_POST['refunded_to']),
		array ("", "  " . $_POST['city'], "", ""),
		array ("", "  " . $_POST['state'] . "  " . $_POST['zipcode'], "", ""),
		array ("", "  " . $_POST['country'], "", ""),		
		);
		//Table data for order receipt
		$rowscount = $_POST['rowscount'];
		$order_table = array();
		$icann = array();
		$fee = array();
		for ($x=1; $x < $rowscount + 5; $x++){		
			if (isset($_POST["icann$x"])){
				$icann[$x] = 1;
				$fee[$x] = "$".$_POST["fee$x"];
			} else {
				$icann[$x] = 0;
				$fee[$x] = 0;
			} 

			if (isset($_POST["type$x"])){
				$row = array ($_POST["type$x"], $_POST["product$x"], $_POST["quantity$x"], $_POST["duration$x"], "$".$_POST["price$x"], "$".$_POST["subtotal$x"]); 
				$order_table [$x] = $row;
			}			
		}
		$rows = count($order_table);
}

if ($_POST['form_id'] == "order_receipt"){
		$pdf=new ORDER();
		$pdf->SetFillColor(211,211,211);
		$pdf->AliasNbPages();
		//Header and Footer functions are called automatically through _constructor
		$pdf->AddPage();
		$pdf->SetFont('Times','',12);
		//Adding Document Title
		$pdf->Cell(75); $pdf->SetFont('Arial','B',18);
		$pdf->Cell(30,10,$filename,'0',0,'R',$fill);
		$pdf->Cell(30,10,$ticketid,'0',0,'L',$fill); 
		$pdf->Ln(20); $pdf->SetFont('Arial','',12);
		//Adding client data fields
		$pdf->BorderlessTable('',$clientdata);
		$pdf->Ln(5);
		//Adding optional VAT Number if exists
		if ($vat_number != ""){
			$pdf->Ln(5);
			$pdf->Cell(40,6,"VAT Number",'0',0,'L',$fill);
			$pdf->Cell(65,6,": " . $vat_number,'0',0,'L',$fill);
			$pdf->Ln(5);$pdf->Ln(5);
		}					
		$table_header = array('TYPE', 'PRODUCT', 'QTY', 'DURATION', 'PRICE', 'SUBTOTAL');		
		$pdf->FancyTable($table_header, $order_table, $icann, $fee);
		$pdf->Cell(152,8,"Subtotal: ",'1',0,'R',$fill);
		$pdf->Cell(30,8,$subtotal,'1',0,'R',$fill); $pdf->Ln(8);
		$pdf->Cell(152,8,"Total: ",'1',0,'R',$fill);
		$pdf->Cell(30,8,$total,'1',0,'R',$fill);
		$file = "$filename"."$ticketid";
		$pdf->Output('I',"$file.pdf"); 
}