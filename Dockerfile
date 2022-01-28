ARG VERSION

FROM hashicorp/terraform:$VERSION as build

RUN adduser -D -H -u 1000 terraform

FROM scratch

COPY --from=build /bin/terraform /bin/terraform 
COPY --from=build /lib/ld-musl-x86_64.so.1 /lib/ld-musl-x86_64.so.1
COPY --from=build /etc/passwd /etc/passwd

USER terraform 

ENTRYPOINT ["/bin/terraform"]