heroku_deploy_and_ensure_report() {
  local deploy_command="$1"
  local report=`$deploy_command`
  local result=$?

  echo "$report" | ggrep -P 'remote: Verifying deploy\.+?done|Everything up-to-date' >/dev/null
  if [ $? -ne 0 ]; then
    result=1
  fi

  return $result
}
