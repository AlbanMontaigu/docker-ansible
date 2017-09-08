
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

# Environment configuration
ENV ANSIBLE_VERSION="2.3.2.0"

# Installation receipe
RUN echo "===> Installing sudo to emulate normal OS behavior..." && \
    apk --update add sudo && \
    \
    \
    echo "===> Adding Python runtime..."  && \
    apk --update add python py-pip openssl ca-certificates && \
    apk --update add --virtual build-dependencies \
                python-dev libffi-dev openssl-dev build-base && \
    pip install --upgrade pip cffi && \
    \
    \
    echo "===> Installing cloudstak API pyton client" && \
    pip install cs && \
    \
    \
    echo "===> Installing Ansible..." && \
    pip install ansible=="${ANSIBLE_VERSION}" && \
    \
    \
    echo "===> Installing handy tools (not absolutely required)..." && \
    apk --update add sshpass openssh-client rsync && \
    \
    \
    echo "===> Removing package list..." && \
    apk del build-dependencies && \
    rm -rf /var/cache/apk/* && \
    \
    \
    echo "===> Adding ansible hosts for convenience..." && \
    mkdir -p /etc/ansible && \
    echo 'localhost' > /etc/ansible/hosts && \
    \
    \
    echo "===> Modifying ansible configuration to enable outdated / self signed SSL..." && \
    sed -i -e "s|verify=True, cert=None|verify=False, cert=None|g" /usr/lib/python2.7/site-packages/cs.py

# default command: display Ansible version
CMD [ "ansible-playbook", "--version" ]
