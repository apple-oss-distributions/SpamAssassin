
# Install config directories
_config_dir=/Library/Server/Mail/Config/
if [ ! -d $_config_dir ];then
  mkdir -p $_config_dir
fi

# Install config files
_src_config_dir="$_server_root/private/etc/mail/spamassassin"
if [ -d $_src_config_dir ];then
  cp -rpf $_src_config_dir $_config_dir
fi

_config_file=$_config_dir/spamassassin/local.cf
_default_config=$_config_dir/spamassassin/local.cf.default
if [ ! -e $_config_file ]; then
    if [ -e $_default_config ]; then
      cp $_default_config $_config_file
    fi
fi

chown root:wheel $_config_file
chmod 644 $_config_file

# Setup /Library/Server/ data
_rules_dir=/Library/Server/Mail/Data/scanner/spamassassin
if [ ! -d $_rules_dir ]; then
  mkdir -p $_rules_dir
fi

_src_dir=$_config_dir/spamassassin/3.003002
if [ ! -d $_rules_dir/3.003002 ]; then
  if [ -d $_src_dir ]; then
    mv $_src_dir $_rules_dir/
  fi
fi

