heroku_deploy_and_ensure_report() {
  local deploy_command="$1"
  local report=`$deploy_command`
  local result=$?

  if ! echo "$report" | grep -sqP 'remote: Verifying deploy\.+?done|Everything up-to-date'; then
    result=1
  fi

  return $result
}
