ARG CENTOS_VERSION
FROM centos:${CENTOS_VERSION}

RUN yum install -y openssh* \
	&& yum install -y net-tools \
	&& yum install -y lsof \
	&& yum install -y telnet \
	&& yum install -y passwd \
	&& yum install -y git

#修改root用户密码,无效
RUN echo "!@#$1qaz80" | passwd --stdin root
#设置不使用ssh服务端pam模块?
RUN sed -i 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config
#创建非对称密钥
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key
#关闭pam.d的ssh会话模块
RUN sed -i '/^session\s\+required\s\+pam_loginuid.so/s/^ /#/' /etc/pam.d/sshd
#创建ssh工作目录并设置权限
RUN mkdir -p /root/.ssh && chown -R root:root /root && chmod 700 /root/.ssh
#暴露端口
EXPOSE 22
#开启sshd服务
CMD ["/usr/sbin/sshd","-D"]