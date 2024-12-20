# Jenkins Sandbox
As stated in the `About` section, this is simply a sandbox for my use of Jenkins.

## Motivation
Backing up a MySQL database to an AWS S3 bucket via AWS CLI from a remote host that's connected to the MySQL server container.

## Setup
This containes 3 docker containers:
1. Jenkins, for automation
2. Production, for AWS CLI and backup
3. For MySQL database

### How to run
First download the this repository, and go to the main root project `jenkins-data` directory.
1. Create .env file in the project root directory and populate in with the environmet variable as stated below.
2. Create `jenkins-home` directory.
3. Create AWS account, with S3 bucket and access keys.

#### Run commands
To build the environment with those containers:
```bash
docker-compose build
docker-compose up -d
```


## Environment variables
This variables defined in .env file in the project root.

```bash
# AWS
AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
AWS_S3_BUCKET_NAME=

# MySQL
MYSQL_PASS=
MYSQL_DB_CONTAINER=mysql-db
MYSQL_DB_NAME=testJenkinsDB
```

### Jenkins integration with those variables
The `.env` and `docker-compose.yml` files define variables for the container. Those become native to the container’s runtime environment but are invisible to Jenkins by default. By creating an `envfile` that explicitly exports these variables, Jenkins can source that file over SSH and thus access the needed variables for its tasks.
