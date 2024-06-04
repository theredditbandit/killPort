echo "updating . . ."
sudo apt update -y
echo "########################################################################"

echo "installing depndencies"
sudo apt install -y build-essential clang llvm libelf-dev golang-go
echo "########################################################################"

echo "installing bpftool . .  ."
cd /home/dev/killport/bpftool/src
make
sudo make install
echo "########################################################################"

echo "installing libpf . . "
cd /home/dev/killport/libbpf/src
make
echo "########################################################################"

echo "link asm/types.h"
sudo ln -s /usr/include/x86_64-linux-gnu/asm /usr/include/asm
echo "########################################################################"

echo "installing go deps"
cd /home/dev/killport/usp/
go mod tidy
echo "########################################################################"

echo "downloading zellij"
cd /home/dev/killport
mkdir dl
cd dl
wget https://github.com/zellij-org/zellij/releases/download/v0.40.1/zellij-x86_64-unknown-linux-musl.tar.gz
tar -xvzf zellij-x86_64-unknown-linux-musl.tar.gz
echo "########################################################################"

echo "setup complete!"

