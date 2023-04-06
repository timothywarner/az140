Set-ItemProperty -Path "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\AppReadinessPreShellTimeoutMs" -Name "AppReadinessPreShellTimeoutMs" -Value 0x7530 -Type DWORD

Set-ItemProperty -Path "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\FirstLogonTimeout" -Name "FirstLogonTimeout" -Value 0x1e -Type DWORD

Set-ItemProperty -Path "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\DelayedDesktopSwitchTimeout" -Name "DelayedDesktopSwitchTimeout" -Value 0x1e -Type DWORD