##Run google chrome inside a fedora docker container over ssh

*Note: Running google-chrome inside a docker container isn't stable for me.*

*I switched back to LXC to run google-chrome which seems to be more stable.*

###Installation instructions

1/ Clone the git repo

```
$ git clone https://github.com/stafwag/docker-fedora-chrome-ssh.git
```

2/ Copy your public ssh to id_rsa.pub

```
$ cd docker-fedora-chrome-ssh
$ cp ~/.ssh/id_rsa.pub .
```

3/ Build the docker image

```
$ docker build -t stafwag/docker-fedora-chrome-ssh .
```

4/ Update your ssh config

```
$ vi ~/.ssh/config
```

```
Host mychrome
          User      chrome
          Port      8022
          HostName  127.0.0.1
          StrictHostKeyChecking no
          UserKnownHostsFile=/dev/null
          ForwardX11 yes
```

5/ Start chrome

```
$ ./startchrome.sh
```


