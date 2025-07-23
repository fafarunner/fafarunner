# Setup Windows

## Requirements

> Self-signed .pfx certificate information format <br>
> subject=C=`<Country Name (2 letter code)>`, ST=`<State or Province Name>`, L=`<Locality Name>`, O=`<Publisher Name>`,
> OU=`<Publisher Name>`, CN=`<Publisher Name>`, emailAddress=`<Email Address>`

```powershell
$PFX_FILE = get-content 'C:\temp\cert.pfx' -Encoding Byte
$base64 = [System.Convert]::ToBase64String($PFX_FILE) | Out-File 'C:\temp\certBase64.txt'

$BASE64_STR = get-content 'C:\temp\certBase64.txt'
$filename = 'C:\temp\dummy-3.pfx'
$bytes = [Convert]::FromBase64String($BASE64_STR)
[IO.File]::WriteAllBytes($filename, $bytes)
```

## Release

```powershell
# https://jrsoftware.org/isinfo.php
# https://distributor.leanflutter.dev/zh-hans/makers/exe/
fastforge package --platform windows --targets exe

# https://flutter.cn/docs/platform-integration/windows/building#msix-packaging
# https://distributor.leanflutter.dev/zh-hans/makers/msix/
fastforge package --platform windows --targets msix
```
