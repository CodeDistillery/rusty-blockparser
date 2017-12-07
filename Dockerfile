FROM rust:1.22 as build

WORKDIR /usr/src/blockparser

COPY . .

RUN cargo build --release && cargo test --release


FROM ubuntu:16.04 as run

WORKDIR /data

COPY --from=build /usr/src/blockparser/target/release /usr/src/blockparser

VOLUME [ "/data" ]

ENTRYPOINT [ "/usr/src/blockparser/rusty-blockparser" ]

CMD [ "--help" ]