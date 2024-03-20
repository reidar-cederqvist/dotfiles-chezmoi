#!/usr/bin/env python

import PIL.Image
import time
import pystray

image = PIL.Image.new('RGB', (100, 100))
icon = pystray.Icon("Test", image, menu=None)
icon.run_detached()
while not icon.visible:
    time.sleep(0.1)

icon.stop()
