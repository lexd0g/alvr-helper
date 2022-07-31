$repo = "alvr-org/alvr-nightly"
$file_android = "alvr_client_oculus_quest.apk"
$file_windows = "alvr_server_windows.zip"

Write-Host 'Downloading latest Windows release...'
curl.exe --progress-bar https://github.com/$repo/releases/latest/download/$file_windows -OL
if ((Get-Item $file_windows).length -gt 20)
	{
		Write-Host 'Extracting archive...'
		Expand-Archive -Force $file_windows
			if ( $? -like 'False' ) {Write-Host 'Extract failed, do you have enough storage space?'}
			else {Write-Host 'Successfully extracted.';rm $file_windows}
	}
else {Write-Host 'Download failed. Check internet connection and download path.';rm $file_windows}

Write-Host 'Starting Android install.'
adb shell exit 2>$null
if ( $? -like 'True' )
	{ 
		Write-Host 'Downloading latest Android release...'
		curl.exe --progress-bar https://github.com/$repo/releases/latest/download/$file_android -OL
		if ((Get-Item $file_android).length -gt 20)
			{
				Write-Host 'Installing ALVR over ADB...'
				adb install $file_android > $null
				if ( $? -like 'True' ) 
					{ 
						Write-Host 'ALVR installed.'
						rm $file_android
					}
					else {Write-Host 'Install failed. Is your Quest connected?'}
			}
		else {Write-Host 'Download failed. Check internet connection and download path.';rm $file_android}
	}
else {Write-Host "Make sure ADB debugging is enabled."}
