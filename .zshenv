export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export JAVA_HOME_8=/Library/Java/JavaVirtualMachines/amazon-corretto-8.jdk/Contents/Home
export JAVA_HOME_11=/Library/Java/JavaVirtualMachines/amazon-corretto-11.jdk/Contents/Home
export JAVA_HOME_17=/Library/Java/JavaVirtualMachines/microsoft-17.jdk/Contents/Home
export JAVA_HOME=$JAVA_HOME_17
if [[ -f "$HOME/.cargo/env" ]]; then
  source "$HOME/.cargo/env"
fi
