#!/bin/sh

/usr/bin/gst-launch-1.0 v4l2src device=/dev/video3 ! 'image/jpeg,width=1920,height=1080,framerate=30/1' !  vpudec output-format=4 ! imxipuvideotransform ! imxg2dclockoverlay time-format="%Y-%m-%d %H:%M:%S" halignment=2 valignment=1 ! imxg2dvideosink sync=false window-width=960 window-height=480 &

/usr/bin/gst-launch-1.0 rtspsrc location=rtsp://admin:XIYFYO@10.20.1.99:554/h264/ch1/main/av_stream latency=10 ! queue ! rtph264depay ! vpudec ! imxg2dvideosink window-width=960 window-height=480 window-y-coord=480 &

/usr/bin/gst-launch-1.0 imxv4l2src device=/dev/video2 ! capsfilter caps="video/x-raw, width=1920, height=1080, framerate=30/1" ! imxipuvideotransform ! imxg2dclockoverlay time-format="%Y-%m-%d %H:%M:%S" halignment=2 valignment=1 ! imxg2dvideosink sync=false window-width=960 window-height=480 window-x-coord=960 &

/usr/bin/gst-launch-1.0 imxv4l2videosrc ! imxipuvideotransform ! imxg2dclockoverlay time-format="%Y-%m-%d %H:%M:%S" halignment=2 valignment=1 ! imxg2dvideosink window-width=960 window-height=480 window-x-coord=960 window-y-coord=480 &
