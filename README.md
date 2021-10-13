# Orion

## Networks

| Network       |                              |
| ------------- | ---------------------------- |
| 10.10.1.0/24  | Externaly Accessable Servers |
| 10.10.2.0/24  | Internal Accessable Servers  |
| 10.100.0.0/24 | USERS via VPN                |

## Servers / Intances 
| External Servers | Role                | IP         |
| ---------------- | ------------------- | ---------- |
| mail-01          | Mail Server         | 10.10.1.15 |
| web-01           | Web Server          | 10.10.1.3  |
| web-02           | Web Server          | 10.10.1.4  |
| surveillance-01  | Surveillance Server | 10.10.1.10 |

| Internal Servers | Role      | IP        |
| ---------------- | --------- | --------- |
| db-01            | MySQL     | 10.10.2.3 |
| db-02            | MySQL     | 10.10.2.4 |
| nc-01            | NextCloud | 10.10.2.9 |
| openstack-01     | Openstack | 10.10.2.7 |


## Security groups
| SG           | PORTS     | Accessable FROM  |
| ------------ | --------- | ---------------- |
| HTTP/HTTPS   | 443       | All              |
| SSH          | 22        | User-network     |
| DB           | 3306      | External-network |
| SMTP         | 587, 2525 | All              |
| Surveillance | 5000      | All              |
