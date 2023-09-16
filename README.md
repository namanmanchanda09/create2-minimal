# create2-minimal

This is an example of how `create2` works.

### Draft

The *PairFactory* can deploy contracts by using the bytecode of *Pair* contract.

```solidity
assembly {
  pair := create2(0, add(bytecode, 0x20), mload(bytecode), 42)
  if iszero(extcodesize(pair)) { revert(0, 0) }
}
```
The same is implemented in *PairFactory* contract.

### Tests

Setup project by running `forge build`, followed by -

```

forge test --match-test testCreateAndGetPair

```


