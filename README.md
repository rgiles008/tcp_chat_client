# Chat

This application is chat client with an TLS server.

It is a secured system with certs that uses `:ssl` instead of `:gen_tcp`

## Installation

- Pull down the project
- cd into the app root
- Run `mkdir priv`
- Run `cd priv`
- generate your certs, in your terminal
```bash
openssl genrsa -out ca.key 2048
openssl req -new -x509 -key ca.key -out ca.pem -days 365 -subj "/CN=MyCA"
openssl genrsa -out server.key 2048
openssl req -new -key server.key -out server.csr -subj "/CN=localhost"
openssl x509 -req \
-in server.csr -CA ca.pem -CAkey ca.key -CAcreateserial \
-out server.crt -days 365
openssl genrsa -out client.key 2048
openssl req -new -key client.key -out client.csr -subj "/CN=client"
openssl x509 -req \
-in client.csr -CA ca.pem -CAkey ca.key -CAcreateserial \
-out client.crt -days 365
```
- Run `mix deps.get`
- Start the TLS server with `POOL=true mix run --no-halt`
- With the server running open two different terminals and run `mix chat_client`

You should now be able to talk back and forth as you'd expect from any normal chat application.

