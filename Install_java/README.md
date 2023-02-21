# How to install JAVA JDK

OpenJDK installer for Debian based systems

## Download OpenJDK or other JDK flavour of your choice

To download OpenJDK go to the official archive website and select the version you want to install:
<https://jdk.java.net/archive/>

## Extract downloaded archive

Use command below to unpack downloaded archive, change name of the archive.

```bash
tar -xzf jdk-file.tar.gz
```

## Set a few temporary variables

```bash
jdk_dir="jdk-version" # Name of the root JDK directory
env_vars="/etc/profile.d/${jdk_dir}.sh"
install_dir="/opt/java"
echo "$jdk_dir \n$env_vars \n$install_dir"
```

## Create directory for JDK installation and move extracted directory

```bash
sudo mkdir ${install_dir}
sudo mv ${jdk_dir} ${install_dir}
```

## Set environment variables

Create a file in `/etc/profile.d/` directory:

```bash
sudo tee ${env_vars} <<- EOF                   
#!/bin/sh
export JAVA_HOME=${install_dir}/${jdk_dir}
export PATH=\$JAVA_HOME/bin:\$PATH
EOF
```

In case another JDK has been installed on your system make sure to comment its environment variables, so that they don't interfere with new settings.
You can check list of another JDKs profile files with command:

```bash
ls /etc/profile.d/jdk*
```

Now apply new settings with command below:

```echo
source ${env_vars}
echo $JAVA_HOME
```

## Add java to system alternatives

Add java and javac to system alternatives:

```bash
sudo update-alternatives --install "/usr/bin/java" "java" "${install_dir}/${jdk_dir}/bin/java" 0 \
    --slave "/usr/local/bin/javac" "javac" "${install_dir}/${jdk_dir}/bin/javac"

sudo update-alternatives --set java "${install_dir}/${jdk_dir}/bin/java"
sudo update-alternatives --list java
```

To change alternatives use:

```bash
sudo update-alternatives --config java
```

To remove alternatives use:

```bash
sudo update-alternatives --remove java "${install_dir}/${jdk_dir}/bin/java"
```

## Verify JDK installation

```bash
echo $JAVA_HOME
java -version
```
