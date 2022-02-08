module github.com/tharsis/evmos

go 1.16

require (
	contrib.go.opencensus.io/exporter/prometheus v0.4.0
	github.com/cosmos/cosmos-sdk v0.44.3
	github.com/cosmos/ibc-go/v2 v2.0.0
	github.com/ethereum/go-ethereum v1.10.11
	github.com/gogo/protobuf v1.3.3
	github.com/golang/protobuf v1.5.2
	github.com/gorilla/mux v1.8.0
	github.com/grpc-ecosystem/grpc-gateway v1.16.0
	github.com/rakyll/statik v0.1.7
	github.com/spf13/cast v1.4.1
	github.com/spf13/cobra v1.3.0
	github.com/stretchr/testify v1.7.0
	github.com/tendermint/tendermint v0.34.14
	github.com/tendermint/tm-db v0.6.6
	github.com/tharsis/ethermint v0.8.0
	go.opencensus.io v0.23.0
	google.golang.org/genproto v0.0.0-20211208223120-3a66f561d7aa
	google.golang.org/grpc v1.43.0
	google.golang.org/protobuf v1.27.1
)

require (
	github.com/adlio/schema v1.1.14 // indirect
	github.com/deckarep/golang-set v1.7.1 // indirect
	github.com/dgraph-io/badger/v2 v2.2007.3 // indirect
	github.com/golang/glog v0.0.0-20210429001901-424d2337a529 // indirect
	github.com/prometheus/tsdb v0.10.0 // indirect
	github.com/rjeczalik/notify v0.9.2 // indirect
	nhooyr.io/websocket v1.8.7 // indirect
)

// replace google.golang.org/grpc => google.golang.org/grpc v1.33.2

replace github.com/gogo/protobuf => github.com/regen-network/protobuf v1.3.3-alpha.regen.1

replace github.com/99designs/keyring => github.com/cosmos/keyring v1.1.7-0.20210622111912-ef00f8ac3d76

// TODO: remove once v0.45 has been released
replace github.com/cosmos/cosmos-sdk => github.com/tharsis/cosmos-sdk v0.44.3-olympus

// replace github.com/tharsis/ethermint => github.com/jbowen93/ethermint v0.6.1-0.20220126203443-f611b0d858da

// replace github.com/celestiaorg/optimint => github.com/jbowen93/optimint v0.0.0-20220126203110-0905be5c836a

replace github.com/tharsis/ethermint => /go/src/github.com/tharsis/evmos/ethermint
replace github.com/celestiaorg/optimint => /go/src/github.com/tharsis/evmos/optimint
