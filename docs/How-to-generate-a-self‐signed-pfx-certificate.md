# How to generate a self‐signed .pfx certificate

1. If you haven't already, download the [OpenSSL](https://slproweb.com/products/Win32OpenSSL.html) toolkit to generate your certificates.
2. Go to where you installed OpenSSL, for example, `C:\Program Files\OpenSSL-Win64\bin`.
3. Set an environment variable so that you can access OpenSSL from anywhere: `"C:\Program Files\OpenSSL-Win64\bin"`
4. Generate a private key as follows: `openssl genrsa -out mykeyname.key 2048`
5. Generate a certificate signing request (CSR) file using the private key: `openssl req -new -key mykeyname.key -out mycsrname.csr`
6. Generate the signed certificate (CRT) file using the private key and CSR file: `openssl x509 -in mycsrname.csr -out mycrtname.crt -req -signkey mykeyname.key -days 10000`
7. Generate the `.pfx` file using the private key and CRT file: `openssl pkcs12 -export -out CERTIFICATE.pfx -inkey mykeyname.key -in mycrtname.crt`
8. Install the `.pfx` certificate first on the local machine in `Certificate store` as `Trusted Root Certification Authorities` before installing the app.
