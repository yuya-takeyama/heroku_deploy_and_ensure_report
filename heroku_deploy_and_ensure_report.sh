heroku_deploy_and_ensure_report() {
  local self_name=${FUNCNAME[0]}
  local tmpfile=mktemp
  local deploy_command=$@
  local exit_status=0

  echo "${self_name}: Running command: ${deploy_command}" >&2

  $deploy_command | tee $tmpfile
  local deploy_result=${PIPESTATUS[0]}

  if [ ! $deploy_result == 0 ]; then
    exit_status=$deploy_result
  else
    if ! grep -sq 'remote: Verifying deploy\.+?done|Everything up-to-date' "${tempfile}"; then
      exit_status=1
    fi

  fi

  rm $tmpfile

  echo "${self_name}: Command exited with ${deploy_result}" >&2

  if [ $exit_status == 0 ]; then
    echo "${self_name}: Successfully deployed!" >&2
  else
    echo "${self_name}: Failed to deploy..." >&2
  fi

  return $exit_status
}
