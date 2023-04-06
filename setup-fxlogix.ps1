# Ref: https://learn.microsoft.com/en-us/azure/virtual-desktop/fslogix-profile-container-configure-azure-files-active-directory?tabs=aadds

# Run the following on sessions hosts
net use p: \\twaz140fxlogix.file.core.windows.net\profiles TlmzTKC1bQdsVEF44CMypa+s63hMVUl+74bgzOgmtkC9BWvFZv9GW4Tzna/9et6ngr0yqjcRmlBt+AStE6+aFw== /user:Azure\twaz140fxlogix

icacls p: /grant "<CERTSTAR\AVDUsers:(M)"
icacls p: /grant "Creator Owner:(OI)(CI)(IO)(M)"
icacls p: /remove "Authenticated Users"
icacls p: /remove "Builtin\Users"

# Install FSLogix ()

# Restart after setting these values
$regPath = "HKLM:\SOFTWARE\FSLogix\Profiles"
New-ItemProperty -Path $regPath -Name Enabled -PropertyType DWORD -Value 1 -Force
New-ItemProperty -Path $regPath -Name VHDLocations -PropertyType MultiString -Value \\twaz140fxlogix.file.core.windows.net\profiles -Force

# Validate by signing in and looking for "Please wait for FSLogix Apps to finish processing"