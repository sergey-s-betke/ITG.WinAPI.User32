[CmdletBinding(
	SupportsShouldProcess=$true,
	ConfirmImpact="Medium"
)]
param ()

Import-Module `
	(Join-Path `
        -Path ( Split-Path -Path ( $MyInvocation.MyCommand.Path ) ) `
        -ChildPath 'ITG.WinAPI.User32' `
    ) `
	-Force `
	-PassThru `
| Get-Readme -OutDefaultFile;