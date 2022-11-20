# How to install JAVA JDK

OpenJDK installer for Debian based systems

## Download OpenJDK or other JDK flavour of your choice

To download OpenJDK go to the official archive website and select the version you want to install:
<https://jdk.java.net/archive/>

## Set a few temporary variables

```bash
jdk_dir="jdk-version" # Name on the root JDK directory
env_vars="/etc/profile.d/${jdk_dir}.sh"
install_dir="/usr/local/lib/jvm/"
```

## Create directory for JDK installation

```bash
sudo mkdir ${install_dir}
```

## Unpack downloaded archive

Use command below to unpack downloaded archive, change name of the archive.

```bash
sudo tar -xvzf jdk-file.tar.gz -C ${install_dir}
```

## Set environment variables

Create a file in `/etc/profile.d/` directory:

```bash
sudo cat <<- EOF > ${env_vars}
#!/bin/sh
export JAVA_HOME=${install_dir}/${jdk_dir}
export PATH=\$JAVA_HOME:\$PATH
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
sudo update-alternatives --install "/usr/local/bin/java" "java" "${install_dir}/${jdk_dir}/bin/java" 0 \
    --slave "/usr/local/bin/javac" "javac" "${install_dir}/${jdk_dir}/bin/javac"

sudo update-alternatives --set java "${install_dir}/${jdk_dir}/bin/java"
sudo update-alternatives --list java
```

To change alternatives use:

```bash
sudo update-alternatives --config java
```
