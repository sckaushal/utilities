param([string] $inputFile, [string] $outfile = "ynabreadyfile.csv")

$output = @();

Import-Csv $inputFile | % {
    $date = Get-Date $_."Transaction Date" -format dd/MM/yyyy;
    $output += [pscustomobject] @{
        Date = $date;
        Payee = "";
        Category = "";
        Memo = $_."Transaction Ref1" + " - " + $_."Transaction Ref2";
        Outflow = $_."Debit Amount";
        Inflow = $_."Credit Amount"
    }
}
$output | Export-Csv $outfile -NoTypeInformation

