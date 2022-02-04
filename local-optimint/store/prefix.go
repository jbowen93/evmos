package store

import "fmt"

var _ KVStore = &PrefixKV{}
var _ Batch = &PrefixKVBatch{}

type PrefixKV struct {
	kv     KVStore
	prefix []byte
}

func NewPrefixKV(kv KVStore, prefix []byte) *PrefixKV {
	return &PrefixKV{
		kv:     kv,
		prefix: prefix,
	}
}

func (p *PrefixKV) Get(key []byte) ([]byte, error) {
	fmt.Printf("[prefix.go] PrefixKV Prefix hex: %x\n", p.prefix)
	//fmt.Printf("[prefix.go] PrefixKV Get key: %#v\n", key)
	fmt.Printf("[prefix.go] PrefixKV Get hex key: %x\n", key)

	return p.kv.Get(append(p.prefix, key...))
}

func (p *PrefixKV) Set(key []byte, value []byte) error {
	fmt.Printf("[prefix.go] PrefixKV Prefix hex: %x\n", p.prefix)
	//fmt.Printf("[prefix.go] PrefixKV Set key: %#v\n", key)
	fmt.Printf("[prefix.go] PrefixKV Set hex key: %x\n", key)
	return p.kv.Set(append(p.prefix, key...), value)
}

func (p *PrefixKV) Delete(key []byte) error {
	return p.kv.Delete(append(p.prefix, key...))
}
func (p *PrefixKV) NewBatch() Batch {
	return &PrefixKVBatch{
		b:      p.kv.NewBatch(),
		prefix: p.prefix,
	}
}

func (p *PrefixKV) PrefixIterator(prefix []byte) Iterator {
	return p.kv.PrefixIterator(append(p.prefix, prefix...))
}

type PrefixKVBatch struct {
	b      Batch
	prefix []byte
}

func (pb *PrefixKVBatch) Set(key, value []byte) error {
	fmt.Printf("[prefix.go] PrefixKVBatch Prefix hex: %x\n", pb.prefix)
	//fmt.Printf("[prefix.go] PrefixKVBatch Set key: %#v\n", key)
	fmt.Printf("[prefix.go] PrefixKVBatch Set hex key: %x\n", key)
	//fmt.Printf("[prefix.go] PrefixKVBatch Set value: %#v\n", value)
	fmt.Printf("[prefix.go] PrefixKVBatch Set hex value: %x\n", value)

	return pb.b.Set(append(pb.prefix, key...), value)
}

func (pb *PrefixKVBatch) Delete(key []byte) error {
	return pb.b.Delete(append(pb.prefix, key...))
}

func (pb *PrefixKVBatch) Commit() error {
	return pb.b.Commit()
}

func (pb *PrefixKVBatch) Discard() {
	pb.b.Discard()
}
