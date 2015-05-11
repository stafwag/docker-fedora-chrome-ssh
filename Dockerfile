FROM fedora:21

MAINTAINER staf wagemakers

#
# Add the chrome repo to yum
#

ADD yum.repos.d/google-chrome.repo /etc/yum.repos.d/

#
# Install the required packages
#

RUN yum clean all
RUN yum update -y
RUN yum install -y initscripts
RUN yum install -y openssh-server
RUN yum install -y xterm
RUN yum install -y xauth
RUN yum install -y libexif
RUN yum install -y google-chrome-stable

RUN useradd -u 1000 chrome -p '*'

#
# Add the ssh public key for the chrome user
#

RUN mkdir /home/chrome/.ssh
ADD id_rsa.pub /home/chrome/.ssh/authorized_keys
RUN chown -R chrome:chrome /home/chrome/.ssh
RUN /usr/sbin/sshd-keygen
RUN echo "X11Forwarding yes" >> /etc/ssh/sshd_config
RUN mkdir -p /home/chrome/.config/google-chrome 
RUN touch /home/chrome/.config/google-chrome/First\ Run
RUN chown -R chrome /home/chrome/
ENTRYPOINT ["/usr/sbin/sshd","-D"]

EXPOSE 22
