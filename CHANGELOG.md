
## 2.7.0 (2018-10-24)
- UPDATE: bump to ansible 2.7.0
- UPDATE: bump docker build to 18.06.1-ce

## 2.6.2 (2018-10-07)
- BUGFIX: ANSIBLE_CONFIG env var added to avoid "world writable directory" issue
- BUGFIX: Separate pip upgrade to avoid version issue
- FEATURE: added kubespray dependencies requirements

## 2.6.2 (2018-05-01)
- UPDATE: bump to ansible 2.6.2
- UPDATE: bump docker build to 18.06.0-ce
- UPDATE: bump to alpine 3.8

## 2.5.2 (2018-05-08)
- UPDATE: pip netaddr added to make ansible kubespray working

## 2.5.2 (2018-05-01)
- UPDATE: bump to ansible 2.5.2
- UPDATE: bump docker build to 18.03.1-ce

## 2.5.0 (2018-03-30)
- UPDATE: bump to ansible 2.5.0
- UPDATE: bump docker build to 18.03.0-ce

## 2.4.3.0 (2018-02-12)
- UPDATE: update to ansible 2.4.3.0
- UPDATE: update docker build to 17.12.0-ce
- UPDATE: update to alpine 3.7

## 2.4.0.0 (2017-10-13)
- UPDATE: maintainer information added inside a `LABEL`
- UPDATE: update to ansible 2.4.0.0
- UPDATE: more simple Dockerfile
- FEATURE: now cert verif for cloudstack can be set off only if env var `CS_CERT` is set to `NO_VERIF`

## 2.3.2.0 (2017-09-08)
- UPDATE: update to ansible 2.3.2.0
- UPDATE: deprecated MAINTAINER removed
- UPDATE: update to alpine 3.6
- UPDATE: move to CircleCI 2.0

## 2.2.1.0 (2017-03-27)
- Initial version with ansible 2.2.1.0
