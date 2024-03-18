# RDS PG Dump (postgresql, pg_dump, aws)

```bash
export PAGER="less -S"
export PGHOST="ABC.123.us-east-1.rds.amazonaws.com"
export PGUSER="owner"
export PGDATABASE="db"
export PGPASSWORD="Sup3r!8"
```

# install pg_dump on Linux AMI 2
```bash
uname -i
#aarch64

#Install Libs
sudo yum install -y https://download.postgresql.org/pub/repos/yum/12/redhat/rhel-7-aarch64/postgresql12-libs-12.6-1PGDG.rhel7.aarch64.rpm

#Install Binaries
sudo yum install -y https://download.postgresql.org/pub/repos/yum/12/redhat/rhel-7-aarch64/postgresql12-12.6-1PGDG.rhel7.aarch64.rpm

#Look at an RPM
#rpm2cpio ./postgresql12-12.6-1PGDG.rhel7.aarch64.rpm | cpio -idmv

#Add to path
exportPATH=$PATH:/usr/pgsql-12/bin
```

# install-amzn2.sh
```bash
uname -i

sudo yum -y update

which amazon-linux-extras \
  ||sudo yum install -y amazon-linux-extras
#/usr/bin/amazon-linux-extras

sudo amazon-linux-extras |grep postgre

sudo amazon-linux-extras enablepostgresql13

sudo yum clean metadata \
  &&sudo yum install postgresql

which pg_dump
```

# Local
```bash
fetch_db_dump() {
  scp -i $AWS_SSH_KEYPAIRec2-user@$1:DbDump-$(date +%Y-%m-%d).sql.xz .;
  unxz DbDump-$(date +%Y-%m-%d).sql.xz;
  cp DbDump-$(date +%Y-%m-%d).sql{,.bkp};
}
```

# Remote
```bash
exportPGHOST=127.0.0.1
exportPGUSER=postgres
exportPGDATABASE=postgres
exportPGPASSWORD=SuperSecret!

db_dump() {
        pg_dump >DbDump-$(date +%Y-%m-%d).sql;
        xz DbDump-$(date +%Y-%m-%d).sql;
}
```
