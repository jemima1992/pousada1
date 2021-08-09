FROM golang:1.8-alpine
ADD . /go/src/pousada
RUN go install pousada

FROM alpine:latest
COPY --from=0 /go/bin/pousada .
ENV PORT 8080
CMD ["./pousada"]