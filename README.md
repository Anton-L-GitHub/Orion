# Orion

## Networks

| Network       | ..                           |
| ------------- | ---------------------------- |
| 10.10.1.0/24  | Externaly Accessable Servers |
| 10.10.2.0/24  | Internal Accessable Servers  |
| 10.100.0.0/24 | USERS                        |

## Servers / Intances 
| External Servers | IP        |
| ---------------- | --------- |
| Web              | 10.10.1.2 |
| Mail             | 10.10.1.3 |


| Internal Servers | IP        |
| ---------------- | --------- |
| Databases        | 0.0.0.0   |
| NextCloud        | 10.10.1.8 |
| Openstack        | 10.10.1.9 |
| Media            | 10.10.1.4 |

## Security groups
| SG           | PORTS     | Accessable FROM  |
| ------------ | --------- | ---------------- |
| HTTP/HTTPS   | 443       | All              |
| SSH          | 22        | User-network     |
| DB           | 3306      | External-network |
| SMTP         | 587, 2525 | All              |
| Surveillance | 5000      | All              |
