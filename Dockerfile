ARG VERSION

FROM hashicorp/terraform:$VERSION as build

RUN apk add tzdata && \                      
    adduser -D -H -u 1000 terraform

# https://gitlab.com/gitlab-org/gitlab-runner/-/issues/26501
#FROM scratch
#COPY --from=build /bin/terraform /bin/terraform 
#COPY --from=build /bin/sh /bin/sh 
#COPY --from=build /lib/ld-musl-x86_64.so.1 /lib/ld-musl-x86_64.so.1
#COPY --from=build /etc/passwd /etc/passwd

USER terraform 

#ENTRYPOINT ["/bin/terraform"]