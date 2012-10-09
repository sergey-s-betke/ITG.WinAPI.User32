Add-Type @" 

using System; 
using System.IO; 
using System.Runtime.InteropServices; 

namespace ITG.WinAPI.User32 {

public
enum HWND {
	Bottom = 1,
	NoTopmost = -2,
	Top = 0,
	Topmost = -1
};

[Flags]
public
enum SWP : uint {
	AsyncWindowPos = 0x4000,
	Defererase = 0x2000,
	DrawFrame = 0x0020,
	FrameChanged = 0x0020,
	HideWindow = 0x0080,
	NoActivate = 0x0010,
	NoCopyBits = 0x0100,
	NoMove = 0x0002,
	NoOwnerZOrder = 0x0200,
	NoRedraw = 0x0008,
	NoReposition = 0x0200,
	NoSendChanging = 0x0400,
	NoSize = 0x0001,
	NoZOrder = 0x0004,
	ShowWindow = 0x0040
};

public
class Window { 

	protected
	IntPtr
	hWnd;
	
	public
	Window (
		IntPtr hWnd
	) {
		this.hWnd = hWnd;
	}
	
	// http://msdn.microsoft.com/en-us/library/windows/desktop/ms633545(v=vs.85).aspx
	[DllImport("user32.dll")] 
	[return: MarshalAs(UnmanagedType.Bool)] 
	protected
	static
	extern
	bool
	SetWindowPos(
		[In] IntPtr hWnd, 
		[In] IntPtr hWndInsertAfter,
		[In] int x,  [In] int y, 
		[In] int cx, [In] int cy, 
		[In] SWP uFlags
	);

	public 
	HWND 
	ZOrder {
		set {
			bool Succeeded  = SetWindowPos(
				this.hWnd,
				(IntPtr) value,
				0, 0, 0, 0,
				( SWP.NoSize | SWP.NoMove )
			);
		}
    }

	// http://msdn.microsoft.com/en-us/library/windows/desktop/ms633539(v=vs.85).aspx
	[DllImport("user32.dll")] 
	[return: MarshalAs(UnmanagedType.Bool)] 
	protected
	static
	extern
	bool
	SetForegroundWindow(
		[In] IntPtr hWnd
	);
	
	public
	bool
	SetForeground(){
		return SetForegroundWindow( this.hWnd );
	}
		
} 

}

"@;

function Set-WindowZOrder {
	<#
		.Synopsis
		    Устанавливает положение окна по оси Z.
		.Description
		    Устанавливает положение окна по оси Z.
            Обёртка для API SetWindowPos.
		.Example
			$ie.HWND | Set-WindowZOrder -PassThru | Set-WindowForeground
	#>
    [CmdletBinding(
    )]
	
    param (
        # дескриптор окна
        [Parameter(
			Mandatory=$true,
			Position=0,
			ValueFromPipeline=$true,
			ValueFromPipelineByPropertyName=$true
		)]
        [System.IntPtr]$HWnd 
	,
		# желаемое положение окна по оси Z
        [Parameter(
			Mandatory=$true,
			Position=1
		)]
        [ITG.WinAPI.User32.HWND] $ZOrder 
	,
        [switch]
        $PassThru 
	)

    process {
        try { 
			$Wnd = [ITG.WinAPI.User32.Window] ( $HWnd );
			$Wnd.ZOrder = $ZOrder;
			if ( $PassThru ) {
				$input;
			};
        } catch [Exception] {
            Write-Error `
                -Exception $_.Exception `
                -Message "Возникла ошибка при изменении Z порядка окон." `
            ;
        };
	}
}  


function Set-WindowForeground {
	<#
		.Synopsis
		    Устанавливает фокус ввода на окно.
		.Description
		    Устанавливает фокус ввода на окно.
            Обёртка для API SetForegroundWindow.
		.Example
			$ie.HWND | Set-WindowZOrder -PassThru | Set-WindowForeground
	#>
    [CmdletBinding(
    )]
	
    param (
        # дескриптор окна
        [Parameter(
			Mandatory=$true,
			Position=0,
			ValueFromPipeline=$true,
			ValueFromPipelineByPropertyName=$true
		)]
        [System.IntPtr]$HWnd 
	,
        [switch]
        $PassThru 
	)

    process {
        try { 
			$Wnd = [ITG.WinAPI.User32.Window] ( $HWnd );
			$Wnd.SetForeground();
			if ( $PassThru ) {
				$input;
			};
        } catch [Exception] {
            Write-Error `
                -Exception $_.Exception `
                -Message "Возникла ошибка при попытке передачи фокуса ввода." `
            ;
        };
	}
};  

Export-ModuleMember `
    Set-WindowZOrder `
    , Set-WindowForeground `
;
