FROM golang:1.17 AS build-env

# Set up dependencies
ENV COSMOS_BUILD_OPTIONS nostrip

# Set working directory for the build
WORKDIR /go/src/github.com/tharsis/evmos

# Install dependencies
RUN apt-get update
RUN apt-get install git

# Add source files
COPY . .

# Make the binary
RUN make build 

# Final image
FROM debian

# Install ca-certificates
RUN apt-get update
RUN apt-get install jq -y

WORKDIR /root

COPY docker/entrypoint.sh .
COPY init.sh .

# Copy over binaries from the build-env
COPY --from=build-env /go/src/github.com/tharsis/evmos/build/evmosd /usr/bin/evmosd

EXPOSE 26656 26657

ENTRYPOINT ["./entrypoint.sh"]
CMD ["evmosd"]
