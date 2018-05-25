./configure --with-features=huge \
							--enable-multibyte \
							--enable-rubyinterp=yes \
							--enable-pythoninterp=yes \
							--with-python-config-dir=/home/eb0025/anaconda2/lib/python2.7/config \
							--enable-python3interp=yes \
							--with-python3-config-dir=/usr/lib/python3.5/config \
							--enable-perlinterp=yes \
							--enable-luainterp=yes \
							--enable-gui=gtk2 \
							--enable-cscope \
							--prefix=/usr/local

If you want to be able to easily uninstall vim use checkinstall.

sudo apt install checkinstall
cd ~/vim
sudo checkinstall
Otherwise, you can use make to install.

cd ~/vim
sudo make install
Set vim as your default editor with update-alternatives.

sudo update-alternatives --install /usr/bin/editor editor /usr/local/bin/vim 1
sudo update-alternatives --set editor /usr/local/bin/vim
sudo update-alternatives --install /usr/bin/vi vi /usr/local/bin/vim 1
sudo update-alternatives --set vi /usr/local/bin/vim
