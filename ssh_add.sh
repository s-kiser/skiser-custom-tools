if [[ -z $(ls -A ~/.ssh/ -I "known_hosts" -I "*.pub" -I "config") ]]; then 
  echo -e "no ssh key";
  ssh-keygen -t rsa 
else
  echo -e "ssh key exists"
fi;