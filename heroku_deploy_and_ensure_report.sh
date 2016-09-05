heroku_deploy_and_ensure_report() {
  local report=$(git push heroku master)
  local result=$?

  echo "$report" | grep -F 'remote: Verifying deploy... done.' >/dev/null
  if [ $? -ne 0 ]; then
    result=1
  fi

  return $result
}
