# Chat

This application is chat client with an TLS server.

It is a secured system with certs that uses `:ssl` instead of `:gen_tcp`

## Installation

- Pull down the project
- Run `mix deps.get`
- Start the TLS server with `POOL=true mix run --no-halt`
- With the server running open two different terminals and run `mix chat_client`

You should now be able to talk back and forth as you'd expect from any normal chat application.

