# Cross compile for Pepper
Reference: http://doc.aldebaran.com/2-4/dev/cpp/install_guide.html

```
pip install qibuild
qibuild config --wizard

```

#### Download Pepper/Nao C++ SDK libraries
https://community.ald.softbankrobotics.com/en/resources/software/language/en-gb

```python test.py -d default "hello.wav"
mkdir ~/sdk
mkdir ~/sdk/naoqi
cd ~/sdk/naoqi
qibuild init
```

Put naoqi-sdk.x.x.tar.gz in:
```
~/sdk/naoqi/naoqi-sdk
```


#### Download cross toolchains
https://community.ald.softbankrobotics.com/en/resources/software/language/en-gb/robot/pepper-3

Unzip ctc-linux64-atom

-x.x.x.zip in:
```
~/sdk/naoqi/ctc-linux64-atom
```
Create toolchain with atom cross toolchain:
```
qitoolchain create atom ~/sdk/naoqi/ctc-linux64-atom/toolchain.xml
```

Go into any worktree (project/code) and run to initialize the build directory and set cross-compiler toolchain to default:
```
qibuild init
qibuild add-config atom -t atom --default
```

Use to make:
```
qibuild configure -c atom
qibuild make
```


## Virtual Machine
# Here, set optimizations for Atom (a.k.a. NAO V4):
```
su
rm -fi /etc/portage
ln -sfv /etc/portage.atom /etc/portage
exit
```
# do some developments...

# Then you can switch back to the generic settings:
```
su
rm -fi /etc/portage
ln -sfv /etc/portage.generic /etc/portage
exit

emerge -ab <package name>
```
