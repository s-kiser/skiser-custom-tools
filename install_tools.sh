#!/bin/bash
echo "Installing skiser tools";
sudo ;
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
echo $user > user.sh;
fi;

# install steps
tool_dir="/opt/skiser/skiser-custom-tools"
sudo mkdir -p $tool_dir

# gitkeep
program="gitkeep"
sudo cp "skiser-git/skiser-$program.sh" "$tool_dir/$program.sh"
sudo chmod 755 "$tool_dir/$program.sh"
sudo chmod +x "$tool_dir/$program.sh"
sudo ln -s "$tool_dir/$program.sh" "/usr/bin/$program"

# ssh_add
program="ssh-key"
sudo cp "skiser-ssh/skiser-$program.sh" "$tool_dir/$program.sh"
sudo chmod 755 "$tool_dir/$program.sh"
sudo chmod +x "$tool_dir/$program.sh"
sudo ln -s "$tool_dir/$program.sh" "/usr/bin/$program"

echo -e "\n$tool_dir/"
ls -lah $tool_dir

echo -e "\n/usr/bin/"
ls -lah /usr/bin/ | grep "gitkeep\|ssh-key"