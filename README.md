# Orion

## Networks

| Network       | ..                                 |
| ------------- | ---------------------------------- |
| 10.10.1.0/24  | Externaly Accessable Servers CHECK |
| 10.10.2.0/24  | Internal Accessable Servers  CHECK |
| 10.100.0.0/24 | USERS                        CHECK |

## Servers / Intances 
| External Servers | IP              |
| ---------------- | --------------- |
| Web              | 10.10.1.2 CHECK |
| Mail             | 10.10.1.3 CHECK |


| Internal Servers | IP              |
| ---------------- | --------------- |
| Databases        | 0.0.0.0   CHECK |
| NextCloud        | 10.10.1.8 CHECK |
| Openstack        | 10.10.1.9 CHECK |
| Media            | 10.10.1.4 CHECK |

## Security groups
| SG         | PORTS     | Accessable FROM         |
| ---------- | --------- | ----------------------- |
| HTTP/HTTPS | 443       | All               CHECK |
| SSH        | 22        | User-network      CHECK |
| DB         | 3306      | External-network  CHECK |
| SMTP       | 587, 2525 | All               CHECK |
