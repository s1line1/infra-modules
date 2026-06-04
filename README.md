### Infra modules

```
infra-modules/
├── alicloud/
│   ├── network/
│   │   ├── vpc
│   │   ├── vswitch
│   │   └── nat               (TBD)
│   ├── compute/
│   │   ├── ecs
│   │   └── autoscaling        (TBD)
│   ├── security/
│   │   ├── security-group
│   │   ├── ram-user           (TBD)
│   │   └── ram-role           (TBD)
│   ├── storage/
│   │   └── oss                (TBD)
│   ├── lb/
│   │   └── slb                (TBD)
│   └── dns/                   (TBD)
├── aws/
│   └── network/
│       ├── vpc
│       └── subnet
└── test/
    ├── alicloud/
    │   ├── compute/
    │   │   └── ecs
    │   ├── network/
    │   │   ├── vpc
    │   │   └── vswitch
    │   └── security/
    │       └── security-group
    └── aws/
        └── network/
            ├── vpc
            └── subnet
```