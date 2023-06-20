# -*- coding: utf-8 -*-
from random import choices


class Translator:
    buck2uni = {
        "b": u"\u0628",  # baa'
        "p": u"\u0629",  # taa'
        "t": u"\u062A",  # taa'
        "v": u"\u062B",  # thaa'
        "x": u"\u062E",  # khaa'
        "d": u"\u062F",  # daal
        "r": u"\u0631",  # raa'
        # "z": u"\u0632",  # zaay
        "s": u"\u0633",  # siin
        "g": u"\u063A",  # ghayn
        "f": u"\u0641",  # faa'
        "q": u"\u0642",  # qaaf
        "k": u"\u0643",  # kaaf
        "l": u"\u0644",  # laam
        "m": u"\u0645",  # miim
        "n": u"\u0646",  # nuun
        "h": u"\u0647",  # haa'
        "w": u"\u0648",  # waaw
        "a": u"\u064E",  # fatHa
        "u": u"\u064F",  # Damma
        "i": u"\u0650",  # kasra
        "o": u"\u0652",  # sukuun
    }

    def create_random_name(self, size=4):
        return ''.join(choices([*self.buck2uni], k=size))

    def translate_string(self, string):
        for k, v in self.buck2uni.items():
            string = string.replace(k, v)
        return string
