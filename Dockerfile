
# ===================================================================================
#
# Ansible* commands with custom features like file inclusions.
#
# Based on William-Yeh/docker-ansible work (thanks !)
#
# @see https://github.com/William-Yeh/docker-ansible/blob/master/alpine3/Dockerfile
# @see https://docs.ansible.com/ansible/guide_cloudstack.html
# ===================================================================================

# Base image
FROM alpine:3.6

# Maintainer
LABEL maintainer="alban.montaigu@gmail.com"

# Environment configuration
ENV ANSIBLE_VERSION="2.4.0.0"

# Installation receipe
RUN apk --no-cache add sudo python py-pip openssl ca-certificates sshpass openssh-client rsync \
    && apk --no-cache add --virtual build-dependencies python-dev libffi-dev openssl-dev build-base \
    && pip install --upgrade pip cffi cs ansible=="${ANSIBLE_VERSION}" \
    && apk del build-dependencies \
    && mkdir -p /etc/ansible \
    && echo 'localhost' > /etc/ansible/hosts \
    && sed -i -e "s|verify=True, cert=None|verify=False, cert=None|g" /usr/lib/python2.7/site-packages/cs.py

# default command: display Ansible version
CMD [ "ansible-playbook", "--version" ]
