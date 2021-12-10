import-module activedirectory

$user = ""
$confirmation = ""

$user = read-host "Entrer le user a supprimer dans l'AD "

try
{
  $ADUser = Get-ADUser -Identity $user -ErrorAction Stop
}
catch
{
  Write-Warning "An error occured: $($_.Exception.Message)"
}

$confirmation = read-host "Etes-vous sur de vouloir supprimer" $user "(oui / non)"

$del = "L'utilisateur a bien ete supprimer"
$cancel = "L'utilisateur n'a pas ete supprimer"

if ( $confirmation -match "oui" -or $confirmation -match "Oui")
{
	Remove-ADUser -Identity $user -Confirm:$false
	$del
	Start-Sleep -Seconds 3
}else{
	$cancel
	Start-Sleep -Seconds 3
}