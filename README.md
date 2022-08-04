# clab-ovs
sample containerlab topo
```
name: mddo-lab
topology:
    nodes:
        test-ovs01:
            image: ghcr.io/ool-mddo/clab-ovs:latest
            kind: linux
        test-crpd01:
            image: crpd:22.1R1.10
            kind: juniper_crpd
        test-crpd02:
            image: crpd:22.1R1.10
            kind: juniper_crpd
    links:
    -   endpoints:
        - test-ovs01:eth1
        - test-crpd01:eth1
    -   endpoints:
        - test-ovs01:eth2
        - test-crpd02:eth1

```
After Deploy
```
containerlab exec --topo ./clab-sample.yml  --label clab-node-kind'\'=linux --cmd 'ovs-vsctl add-br lan'
containerlab exec --topo ./clab-sample.yml  --label clab-node-kind'\'=linux --cmd 'ovs-vsctl add-port lan eth1'
containerlab exec --topo ./clab-sample.yml  --label clab-node-kind'\'=linux --cmd 'ovs-vsctl add-port lan eth2'
```
