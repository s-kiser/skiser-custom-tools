#!/bin/bash
echo "Installing skiser tools";

if [[ ! -e "user.sh" ]]; then
  # prompt for name
  read -p "Name: " user_name
  
  # prompt for username
  read -p  "Username: " user_username
  
  # prompt for email
  read -p  "Email: " user_email
  
  # create user file (no git tracking on this file)
  user=$(cat <<EOF
#!/bin/bash
username="$user_username"
email="$user_email"
EOF
);
echo $user;
fi;

# install steps
sudo mkdir -p /opt/skiser/Toolbox

# gitkeep
program="gitkeep"
sudo cp "$program.sh" "/opt/skiser/Toolbox/$program.sh"
sudo chmod 755 "/opt/skiser/Toolbox/$program.sh"
sudo chmod +x "/opt/skiser/Toolbox/$program.sh"
sudo ln -s "/opt/skiser/Toolbox/$program.sh" "/usr/bin/$program"

# ssh_add
program="ssh_add"
sudo cp "$program.sh" "/opt/skiser/Toolbox/$program.sh"
sudo chmod 755 "/opt/skiser/Toolbox/$program.sh"
sudo chmod +x "/opt/skiser/Toolbox/$program.sh"
sudo ln -s "/opt/skiser/Toolbox/$program.sh" "/usr/bin/$program"

echo -e "\n/opt/skiser/Toolbox/"
ls -lah /opt/skiser/Toolbox

echo -e "\n/usr/bin/"
ls -lah /usr/bin/ | grep "gitkeep\|ssh_add"