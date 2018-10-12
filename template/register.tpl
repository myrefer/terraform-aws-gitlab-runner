gitlab-runner register -n \
  --url="${gitlab_url}" \
  --registration-token="${runners_token}" \
  --executor="docker+machine" \
  --limit=${runners_limit} \
  --docker-tlsverify=false \
  --docker-image="docker:18.03.1-ce" \
  --docker-privileged=${runners_privilled} } \
  --docker-disable-cache=false \
  --docker-volumes="/cache" \
  --docker-shm-size=0 \
  --cache-type="s3" \
  --cache-s3-server-address="s3-${aws_region}.amazonaws.com" \
  --cache-s3-access-key="${bucket_user_access_key}" \
  --cache-s3-secret-key="${bucket_user_secret_key}" \
  --cache-s3-bucket-name="${bucket_name}" \
  --cache-s3-insecure=false \
  --machine-idle-nodes=${runners_idle_count} \
  --machine-idle-time=${runners_idle_time} \
  --machine-machine-driver="amazonec2" \
  --machine-machine-name="runner-%s" \
  --machine-machine-options="amazonec2-instance-type=${runners_instance_type}" \
  --machine-machine-options="amazonec2-region=${aws_region}" \
  --machine-machine-options="amazonec2-vpc-id=${runners_vpc_id}" \
  --machine-machine-options="amazonec2-subnet-id=${runners_subnet_id}" \
  --machine-machine-options="amazonec2-private-address-only=${runners_use_private_address}" \
  --machine-machine-options="amazonec2-request-spot-instance=true" \
  --machine-machine-options="amazonec2-spot-price=${runners_spot_price_bid}" \
  --machine-machine-options="amazonec2-security-group=${runners_security_group_name}" \
  --machine-machine-options="amazonec2-tags=environment,${environment}" \
  --machine-machine-options="amazonec2-monitoring=${runners_monitoring}" \
  --machine-machine-options="amazonec2-root-size=${runners_root_size}" \
  --machine-off-peak-timezone="${runners_off_peak_timezone}" \
  --machine-off-peak-idle-count=${runners_off_peak_idle_count} \
  --machine-off-peak-idle-time=${runners_off_peak_idle_time} \
  --machine-off-peak-periods="* * 0-9,17-23 * * mon-fri *" \
  --machine-off-peak-periods="* * * * * sat,sun *"
