# -*- coding: utf-8 -*-

import re
from xkeysnail.transform import *

define_timeout(1)

define_modmap({
    Key.CAPSLOCK: Key.LEFT_ALT,
    Key.LEFT_ALT: Key.LEFT_CTRL,
})

define_keymap(None, {
    K("M-h"): K("Left"),
    K("M-j"): K("Down"),
    K("M-k"): K("Up"),
    K("M-l"): K("Right"),
    K("M-TAB"): K("C-TAB"),
    K("M-Shift-TAB"): K("C-Shift-TAB"),
})

