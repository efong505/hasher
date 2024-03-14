Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
Add-Type -AssemblyName PresentationFramework

<# $hash = Read-Host "Please enter hash for file: "
$FileBrowser = New-Object System.Windows.Forms.OpenFileDialog -Property @{ InitialDirectory = [Environment]::GetFolderPath('Desktop') }
$null = $FileBrowser.ShowDialog()
$filehash = Get-FileHash $FileBrowser.filename -Algorithm SHA1

if($hash -eq $filehash.Hash) {
	Write-Host "Hash matches!"
} else {
	Write-Host "Hash doesn't match!"
}
#>


$form = New-Object System.Windows.Forms.Form
$form.Text = 'Enter Hash...'
$form.Size = New-Object System.Drawing.Size(400,150)
$form.StartPosition = 'CenterScreen'

$okButton = New-Object System.Windows.Forms.Button
$okButton.Location = New-Object System.Drawing.Point(35,80)
$okButton.Size = New-Object System.Drawing.Size(75,23)
$okButton.Text = 'OK'
$okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $okButton
$form.Controls.Add($okButton)

$cancelButton = New-Object System.Windows.Forms.Button
$cancelButton.Location = New-Object System.Drawing.Point(120,80)
$cancelButton.Size = New-Object System.Drawing.Size(65,23)
$cancelButton.Text = 'Cancel'
$cancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$form.CancelButton = $cancelButton
$form.Controls.Add($cancelButton)

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10,20)
$label.Size = New-Object System.Drawing.Size(280,20)
$label.Text = 'Please enter the hash below:'
$form.Controls.Add($label)

$textBox = New-Object System.Windows.Forms.TextBox
$textBox.Location = New-Object System.Drawing.Point(10,40)
$textBox.Size = New-Object System.Drawing.Size(360,20)
$form.Controls.Add($textBox)

$form.Topmost = $true

$form.Add_Shown({$textBox.Select()})
$result = $form.ShowDialog()

if ($result -eq [System.Windows.Forms.DialogResult]::OK)
{
    $hash = $textBox.Text
    
}

$FileBrowser = New-Object System.Windows.Forms.OpenFileDialog -Property @{ InitialDirectory = [Environment]::GetFolderPath('Desktop') }
$null = $FileBrowser.ShowDialog()
$filehash = Get-FileHash $FileBrowser.filename -Algorithm SHA1
<#
if($hash -eq $filehash.Hash) {
	Write-Host "Hash matches!"
} else {
	Write-Host "Hash doesn't match!"
}
#>
if($hash -eq $filehash.Hash) {
	[System.Windows.MessageBox]::Show("Hash matches!")
} else {
	[System.Windows.MessageBox]::Show("Hash doesn't match!")
}
