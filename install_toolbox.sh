#!/bin/bash
echo "Installing skiser tools";
sudo mkdir -p /opt/skiser/Toolbox
sudo cp gitkeep.sh /opt/skiser/Toolbox/gitkeep.sh
sudo chmod 755 /opt/skiser/Toolbox/gitkeep.sh
sudo chmod +x /opt/skiser/Toolbox/gitkeep.sh
sudo ln -s /opt/skiser/Toolbox/gitkeep.sh /usr/bin/gitkeep

echo -e "\n/opt/skiser/Toolbox/"
ls -lah /opt/skiser/Toolbox

echo -e "\n/usr/bin/"
ls -lah /usr/bin/ | grep gitkeep