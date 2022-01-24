
#terraform import google_logging_metric.default {{project}} {{name}}

#terraform import google_logging_metric.default foobarles-rehearsal user/test_gw_roundtrip

#terraform import google_logging_metric.imported "foobarles-rehearsal test_gw_download_latency"

#test_channel_mbps_linear
#test_edge_session_duration
#test_gw_download_latency
#test_gw_roundtrip

#test_gw_upload_latency
#test_upload_mbps_linear

# THIS FINALLY WORKED
#terraform import google_logging_metric.channel_mbps_linear test_channel_mbps_linear
#terraform import google_logging_metric.edge_session_duration test_edge_session_duration
#terraform import google_logging_metric.gw_download_latency test_gw_download_latency
#terraform import google_logging_metric.gw_roundtrip test_gw_roundtrip
#terraform import google_logging_metric.gw_upload_latency test_gw_upload_latency
terraform import google_logging_metric.upload_mbps_linear test_upload_mbps_linear


