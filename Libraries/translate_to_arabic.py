# -*- coding: utf-8 -*-
import re
from random import choices

# pylint: disable=W1406


class Translator:
    buck2uni = {
        "b": u"\u0628",
        "p": u"\u0629",
        "t": u"\u062A",
        "v": u"\u062B",
        "x": u"\u062E",
        "d": u"\u062F",
        "r": u"\u0631",
        "z": u"\u0632",
        "s": u"\u0633",
        "g": u"\u063A",
        "f": u"\u0641",
        "q": u"\u0642",
        "k": u"\u0643",
        "l": u"\u0644",
        "m": u"\u0645",
        "n": u"\u0646",
        "h": u"\u0647",
        "w": u"\u0648",
        "a": u"\u064E",
        "u": u"\u064F",
        "i": u"\u0650",
        "o": u"\u0652",
    }

    def create_random_name(self, size=4):
        return ''.join(choices([*self.buck2uni], k=size))

    def translate_string(self, string):
        for k, v in self.buck2uni.items():
            string = string.replace(k, v)
        return string

    def validate_and_return_names(self):
        match = english = arabic = None
        while not match:
            english = self.create_random_name()
            arabic = self.translate_string(english)
            match = re.search(r'^[\u0621-\u064A\u0660-\u0669 ]+$', arabic)
        return english, arabic
