# 🚀 Custom Frappe Docker Build

This repository describes how to build a custom Frappe Docker image using a base64-encoded `apps.json`. It supports custom apps and uses specific Python and Node.js versions for compatibility.

---

## 📦 Prerequisites

Ensure you have the following installed:

- [Docker](https://www.docker.com/)
- Access to the internet to clone repositories from GitHub
- Your custom `apps.json` file

---

## 📝 Step 1: Base64 Encode `apps.json`

Create your `apps.json` file. Here's an example:

```json
[
  {
    "url": "https://github.com/frappe/erpnext",
    "branch": "version-15"
  },
  {
    "url": "https://github.com/resilient-tech/india-compliance.git",
    "branch": "version-15"
  }
]
```

Base64 encoded value

```
WwogIHsKICAgICJ1cmwiOiAiaHR0cHM6Ly9naXRodWIuY29tL2ZyYXBwZS9lcnBuZXh0IiwKICAgICJicmFuY2giOiAidmVyc2lvbi0xNSIKICB9LAogIHsKICAgICJ1cmwiOiAiaHR0cHM6Ly9naXRodWIuY29tL3Jlc2lsaWVudC10ZWNoL2luZGlhLWNvbXBsaWFuY2UuZ2l0IiwKICAgICJicmFuY2giOiAidmVyc2lvbi0xNSIKICB9Cl0
```

## 🏗️ Step 2: Build the base docker image for ErpNext and India Compliance 
```
docker build --build-arg FRAPPE_PATH=https://github.com/frappe/frappe --build-arg FRAPPE_BRANCH=version-15 --build-arg PYTHON_VERSION=3.11.9 --build-arg NODE_VERSION=18.20.2 --build-arg APPS_JSON_BASE64=WwogIHsKICAgICJ1cmwiOiAiaHR0cHM6Ly9naXRodWIuY29tL2ZyYXBwZS9lcnBuZXh0IiwKICAgICJicmFuY2giOiAidmVyc2lvbi0xNSIKICB9LAogIHsKICAgICJ1cmwiOiAiaHR0cHM6Ly9naXRodWIuY29tL3Jlc2lsaWVudC10ZWNoL2luZGlhLWNvbXBsaWFuY2UuZ2l0IiwKICAgICJicmFuY2giOiAidmVyc2lvbi0xNSIKICB9Cl0= --tag=frappe-ssingh-v1 --file=images/custom/Containerfile . --no-cache

```


### 🧹 Optional: Cleanup Docker Resources
* Stop and remove containers, volumes, and orphans

    `docker compose down --volumes --remove-orphans`

* Remove unused Docker resources (dangling volumes, images, etc.)

    `docker system prune --volumes --force`


### [Help Articles](#help)

- [Migration from VM to container](https://medium.com/@yashwanthtss7/dockerize-custom-application-in-frappe-framework-migration-from-vm-to-container-bac073ec1040)
- [1. Upgrade from 14 to 15](https://codewithkarani.com/2024/01/03/how-to-upgrade-erpnext-from-version-14-to-version-15/)
- [2. Upgrade from 14 to 15](https://cloud.erpgulf.com/blog/support-forum/erpnext-upgrade-from-version-14-to-version-15-ubnutu)


