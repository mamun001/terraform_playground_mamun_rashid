#!/bin/bash

# This is shell script that will import various log-based metric that already exists in GCP
# This will FAIL if these log-metrics do not exist
#
#  However , these commands are useful, because you can make them work just by tweaking the names to match what you already have


# Basic Format:
#terraform import google_logging_metric.default {{project}} {{name}}


# Examples
# THESE FINALLY WORKED
#terraform import google_logging_metric.channel_mbps_linear test_channel_mbps_linear
#terraform import google_logging_metric.edge_session_duration test_edge_session_duration
#terraform import google_logging_metric.gw_download_latency test_gw_download_latency
#terraform import google_logging_metric.gw_roundtrip test_gw_roundtrip
#terraform import google_logging_metric.gw_upload_latency test_gw_upload_latency
#terraform import google_logging_metric.upload_mbps_linear test_upload_mbps_linear


