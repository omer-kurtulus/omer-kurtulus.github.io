{
    "patcher": {
        "fileversion": 1,
        "appversion": {
            "major": 9,
            "minor": 1,
            "revision": 4,
            "architecture": "x64",
            "modernui": 1
        },
        "classnamespace": "box",
        "rect": [ 34.0, 92.0, 1372.0, 774.0 ],
        "openinpresentation": 1,
        "boxes": [
            {
                "box": {
                    "id": "title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 20.0, 520.0, 20.0 ],
                    "text": "SomaxVocalMorph — Vocal Input → Corpus Transformation (Somax 2.7)"
                }
            },
            {
                "box": {
                    "id": "subtitle",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 45.0, 640.0, 20.0 ],
                    "text": "Load vocal WAV/AIFF below → influencer analyzes → player navigates loaded corpus → transformed audio out."
                }
            },
            {
                "box": {
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "server-app",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "somax.server.app.maxpat",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "", "", "", "" ],
                    "patching_rect": [ 20.0, 90.0, 250.0, 300.0 ],
                    "varname": "somax.server.app",
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "id": "file-open-msg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 310.0, 90.0, 50.0, 22.0 ],
                    "text": "open"
                }
            },
            {
                "box": {
                    "id": "file-play-toggle",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 370.0, 90.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "file-player",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 3,
                    "outlettype": [ "signal", "signal", "bang" ],
                    "patching_rect": [ 310.0, 130.0, 80.0, 22.0 ],
                    "text": "sfplay~ 2"
                }
            },
            {
                "box": {
                    "id": "file-mixdown",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "multichannelsignal" ],
                    "patching_rect": [ 400.0, 130.0, 110.0, 22.0 ],
                    "text": "mc.mixdown~ 1"
                }
            },
            {
                "box": {
                    "id": "input-gain",
                    "lastchannelcount": 0,
                    "maxclass": "live.gain~",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "orientation": 1,
                    "outlettype": [ "signal", "signal", "", "float", "list" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 520.0, 130.0, 90.0, 47.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 154.0, 380.0, 324.0, 47.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "live.gain~[2]",
                            "parameter_mmax": 6.0,
                            "parameter_mmin": -70.0,
                            "parameter_modmode": 0,
                            "parameter_shortname": "live.gain~[2]",
                            "parameter_type": 0,
                            "parameter_unitstyle": 4
                        }
                    },
                    "varname": "live.gain~"
                }
            },
            {
                "box": {
                    "args": [ "VocalInfluencer" ],
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "audio-influencer-app",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "somax.audioinfluencer.app.maxpat",
                    "numinlets": 1,
                    "numoutlets": 5,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "", "multichannelsignal", "", "", "" ],
                    "patching_rect": [ 310.0, 200.0, 250.0, 325.0 ],
                    "varname": "somax.audioinfluencer.app",
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "id": "player-mixdown",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "multichannelsignal" ],
                    "patching_rect": [ 880.0, 430.0, 175.0, 22.0 ],
                    "text": "mc.mixdown~ 1 @autogain 1"
                }
            },
            {
                "box": {
                    "id": "player-unpack",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 880.0, 460.0, 105.0, 22.0 ],
                    "text": "mc.unpack~ 1"
                }
            },
            {
                "box": {
                    "id": "master-toggle",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 880.0, 500.0, 28.0, 28.0 ]
                }
            },
            {
                "box": {
                    "id": "master-load-zero",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 920.0, 505.0, 85.0, 22.0 ],
                    "text": "loadmess 0"
                }
            },
            {
                "box": {
                    "id": "master-ramp-msg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 880.0, 540.0, 60.0, 22.0 ],
                    "text": "$1 50"
                }
            },
            {
                "box": {
                    "id": "master-ramp-line",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "bang" ],
                    "patching_rect": [ 950.0, 540.0, 45.0, 22.0 ],
                    "text": "line~"
                }
            },
            {
                "box": {
                    "id": "master-clip",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 880.0, 575.0, 125.0, 22.0 ],
                    "text": "clip~ -0.707 0.707"
                }
            },
            {
                "box": {
                    "id": "master-mul",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 880.0, 605.0, 38.0, 22.0 ],
                    "text": "*~"
                }
            },
            {
                "box": {
                    "id": "audio-dsp",
                    "maxclass": "ezdac~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 880.0, 635.0, 48.0, 48.0 ]
                }
            },
            {
                "box": {
                    "id": "builder-open-button",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 880.0, 710.0, 22.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "builder-open-msg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 910.0, 710.0, 90.0, 22.0 ],
                    "text": "openwindow"
                }
            },
            {
                "box": {
                    "id": "audio-corpus-builder",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 5,
                    "outlettype": [ "", "multichannelsignal", "", "", "" ],
                    "patching_rect": [ 880.0, 740.0, 220.0, 22.0 ],
                    "text": "somax.audiocorpusbuilder",
                    "varname": "somax.audiocorpusbuilder"
                }
            },
            {
                "box": {
                    "id": "builder-source-button",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 880.0, 775.0, 22.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "builder-source-dialog",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "patching_rect": [ 910.0, 775.0, 85.0, 22.0 ],
                    "text": "opendialog"
                }
            },
            {
                "box": {
                    "id": "builder-build-prepend",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1005.0, 775.0, 115.0, 22.0 ],
                    "text": "prepend build"
                }
            },
            {
                "box": {
                    "id": "builder-note",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1010.0, 691.0, 263.0, 47.0 ],
                    "text": "GELİŞMİŞ: yeni korpus üretmek için Builder penceresini aç, tek bir kaynak WAV/AIFF/FLAC seç, segment aralığını ayarla, Build'e bas."
                }
            },
            {
                "box": {
                    "id": "dsp-label",
                    "linecount": 4,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 937.0, 629.0, 72.0, 60.0 ],
                    "text": "MASTER DSP / DAC — loads muted"
                }
            },
            {
                "box": {
                    "args": [ "VocalMorphPlayer" ],
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "player-app",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "somax.player.app.maxpat",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "multichannelsignal", "", "", "", "" ],
                    "patching_rect": [ 600.0, 90.0, 250.0, 650.0 ],
                    "varname": "somax.player.app",
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "id": "corpus-load-note",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 880.0, 40.0, 220.0, 47.0 ],
                    "text": "CORPUS PATH: choose the folder containing .pickle + audio. CORPUS FILE: choose a .pickle directly."
                }
            },
            {
                "box": {
                    "id": "corpus-folder-button",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1098.0, 63.0, 22.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "corpus-folder-dialog",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "patching_rect": [ 1106.0, 155.0, 110.0, 22.0 ],
                    "text": "opendialog fold"
                }
            },
            {
                "box": {
                    "id": "corpus-folder-prepend",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1218.0, 155.0, 140.0, 22.0 ],
                    "text": "prepend corpuspath"
                }
            },
            {
                "box": {
                    "id": "corpus-file-button",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1090.0, 112.0, 22.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "corpus-file-dialog",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "patching_rect": [ 1110.0, 190.0, 90.0, 22.0 ],
                    "text": "opendialog"
                }
            },
            {
                "box": {
                    "id": "corpus-file-guard",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 1228.0, 190.0, 170.0, 22.0 ],
                    "saved_object_attributes": {
                        "filename": "vocalmorph_guard.js",
                        "parameter_enable": 0
                    },
                    "text": "js vocalmorph_guard.js"
                }
            },
            {
                "box": {
                    "id": "weights-preset-label",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 884.0, 112.0, 220.0, 47.0 ],
                    "text": "Weight presets (6-layer 2.7): selfPitch selfChroma selfMFCC extPitch extChroma extMFCC"
                }
            },
            {
                "box": {
                    "id": "w-vocal-led",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 880.0, 210.0, 220.0, 22.0 ],
                    "text": "weights 0.4 0.2 0.1 0.5 0.3 0.4"
                }
            },
            {
                "box": {
                    "id": "w-texture-led",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 880.0, 240.0, 220.0, 22.0 ],
                    "text": "weights 0.1 0.1 0.5 0.1 0.1 0.6"
                }
            },
            {
                "box": {
                    "id": "w-balanced",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 880.0, 270.0, 244.0, 22.0 ],
                    "text": "weights 0.25 0.25 0.25 0.25 0.25 0.25"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.086, 0.086, 0.106, 1.0 ],
                    "bordercolor": [ 0.25, 0.25, 0.28, 1.0 ],
                    "id": "ui-root",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1180.0, 40.0, 120.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 0.0, 0.0, 1400.0, 790.0 ],
                    "rounded": 0
                }
            },
            {
                "box": {
                    "id": "output-note",
                    "linecount": 4,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 880.0, 320.0, 220.0, 60.0 ],
                    "text": "Player output is explicitly routed through safety limiting and the MASTER DSP/DAC toggle below. It loads muted."
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 20.0,
                    "id": "ui-title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1131.0, 6.0, 460.0, 29.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 24.0, 14.0, 620.0, 29.0 ],
                    "text": "SOMAX VOCAL MORPH  V2",
                    "textcolor": [ 0.882, 0.882, 0.902, 1.0 ]
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 11.0,
                    "id": "ui-subtitle",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1180.0, 100.0, 569.0, 19.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 26.0, 44.0, 660.0, 19.0 ],
                    "text": "Somax merkezde; çıkışı granüler / bulanık / nöral katmanlardan geçer. Katmanlar canlı açılıp kapanır, kayıt 4 kanal.",
                    "textcolor": [ 0.596, 0.6, 0.647, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.216, 0.216, 0.251, 1.0 ],
                    "bgoncolor": [ 0.043, 0.706, 0.612, 1.0 ],
                    "fontface": 1,
                    "fontsize": 14.0,
                    "id": "ui-quickstart",
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "outputmode": 0,
                    "parameter_enable": 0,
                    "patching_rect": [ 1180.0, 130.0, 260.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 716.0, 14.0, 260.0, 52.0 ],
                    "rounded": 6.0,
                    "text": "TEK TUŞ HAZIRLIK",
                    "textcolor": [ 0.882, 0.882, 0.902, 1.0 ],
                    "texton": "",
                    "textoncolor": [ 0.075, 0.075, 0.086, 1.0 ],
                    "textovercolor": [ 0.882, 0.882, 0.902, 1.0 ],
                    "truncate": 0
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.145, 0.145, 0.172, 1.0 ],
                    "border": 1,
                    "bordercolor": [ 0.271, 0.271, 0.318, 1.0 ],
                    "id": "ui-p1",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1180.0, 160.0, 120.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 24.0, 84.0, 470.0, 164.0 ],
                    "rounded": 6
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "ui-l1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1180.0, 190.0, 300.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 40.0, 94.0, 300.0, 20.0 ],
                    "text": "1 · MOTORU BAŞLAT",
                    "textcolor": [ 0.043, 0.706, 0.612, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.216, 0.216, 0.251, 1.0 ],
                    "bgoncolor": [ 0.043, 0.706, 0.612, 1.0 ],
                    "fontface": 1,
                    "fontsize": 13.0,
                    "id": "ui-srv-start",
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "outputmode": 0,
                    "parameter_enable": 0,
                    "patching_rect": [ 1680.0, 40.0, 270.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 40.0, 120.0, 270.0, 44.0 ],
                    "rounded": 6.0,
                    "text": "SUNUCUYU BAŞLAT",
                    "textcolor": [ 0.882, 0.882, 0.902, 1.0 ],
                    "texton": "",
                    "textoncolor": [ 0.075, 0.075, 0.086, 1.0 ],
                    "textovercolor": [ 0.882, 0.882, 0.902, 1.0 ],
                    "truncate": 0
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.216, 0.216, 0.251, 1.0 ],
                    "bgoncolor": [ 0.98, 0.616, 0.106, 1.0 ],
                    "fontface": 1,
                    "fontsize": 11.0,
                    "id": "ui-srv-reload",
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "outputmode": 0,
                    "parameter_enable": 0,
                    "patching_rect": [ 1680.0, 70.0, 160.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 318.0, 120.0, 160.0, 44.0 ],
                    "rounded": 6.0,
                    "text": "YENİDEN YÜKLE",
                    "textcolor": [ 0.882, 0.882, 0.902, 1.0 ],
                    "texton": "",
                    "textoncolor": [ 0.075, 0.075, 0.086, 1.0 ],
                    "textovercolor": [ 0.882, 0.882, 0.902, 1.0 ],
                    "truncate": 0
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.098, 0.098, 0.118, 1.0 ],
                    "bgcolor2": [ 0.098, 0.098, 0.118, 1.0 ],
                    "bgfillcolor_angle": 270.0,
                    "bgfillcolor_autogradient": 0.0,
                    "bgfillcolor_color": [ 0.098, 0.098, 0.118, 1.0 ],
                    "bgfillcolor_color1": [ 0.098, 0.098, 0.118, 1.0 ],
                    "bgfillcolor_color2": [ 0.098, 0.098, 0.118, 1.0 ],
                    "bgfillcolor_proportion": 0.39,
                    "bgfillcolor_type": "color",
                    "fontsize": 12.0,
                    "gradient": 1,
                    "id": "ui-srv-status",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1680.0, 220.0, 438.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 40.0, 172.0, 438.0, 22.0 ],
                    "text": "running",
                    "textcolor": [ 0.043, 0.706, 0.612, 1.0 ]
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 9.0,
                    "id": "ui-h1",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1180.0, 220.0, 438.0, 27.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 40.0, 204.0, 553.0, 17.0 ],
                    "text": "Durum \"ready\" ya da \"running\" yazana kadar bekle. \"duplicate\" görürsen açık diğer Max pencerelerini kapat ve YENİDEN YÜKLE'ye bas.",
                    "textcolor": [ 0.596, 0.6, 0.647, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.145, 0.145, 0.172, 1.0 ],
                    "border": 1,
                    "bordercolor": [ 0.271, 0.271, 0.318, 1.0 ],
                    "id": "ui-p2",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1180.0, 250.0, 120.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 506.0, 84.0, 470.0, 164.0 ],
                    "rounded": 6
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "ui-l2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1180.0, 280.0, 300.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 522.0, 94.0, 300.0, 20.0 ],
                    "text": "2 · KORPUS SEÇ",
                    "textcolor": [ 0.204, 0.522, 0.918, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.216, 0.216, 0.251, 1.0 ],
                    "bgoncolor": [ 0.204, 0.522, 0.918, 1.0 ],
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "ui-corpus-folder",
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "outputmode": 0,
                    "parameter_enable": 0,
                    "patching_rect": [ 2158.0, 40.0, 225.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 522.0, 120.0, 225.0, 44.0 ],
                    "rounded": 6.0,
                    "text": "KORPUS KLASÖRÜ",
                    "textcolor": [ 0.882, 0.882, 0.902, 1.0 ],
                    "texton": "",
                    "textoncolor": [ 0.075, 0.075, 0.086, 1.0 ],
                    "textovercolor": [ 0.882, 0.882, 0.902, 1.0 ],
                    "truncate": 0
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.216, 0.216, 0.251, 1.0 ],
                    "bgoncolor": [ 0.204, 0.522, 0.918, 1.0 ],
                    "fontface": 1,
                    "fontsize": 11.0,
                    "id": "ui-corpus-load",
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "outputmode": 0,
                    "parameter_enable": 0,
                    "patching_rect": [ 2158.0, 70.0, 207.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 755.0, 120.0, 207.0, 44.0 ],
                    "rounded": 6.0,
                    "text": "KORPUS YÜKLE (.pickle)",
                    "textcolor": [ 0.882, 0.882, 0.902, 1.0 ],
                    "texton": "",
                    "textoncolor": [ 0.075, 0.075, 0.086, 1.0 ],
                    "textovercolor": [ 0.882, 0.882, 0.902, 1.0 ],
                    "truncate": 0
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.098, 0.098, 0.118, 1.0 ],
                    "bgcolor2": [ 0.098, 0.098, 0.118, 1.0 ],
                    "bgfillcolor_angle": 270.0,
                    "bgfillcolor_autogradient": 0.0,
                    "bgfillcolor_color": [ 0.098, 0.098, 0.118, 1.0 ],
                    "bgfillcolor_color1": [ 0.098, 0.098, 0.118, 1.0 ],
                    "bgfillcolor_color2": [ 0.098, 0.098, 0.118, 1.0 ],
                    "bgfillcolor_proportion": 0.39,
                    "bgfillcolor_type": "color",
                    "fontsize": 11.0,
                    "gradient": 1,
                    "id": "ui-corpus-status",
                    "linecount": 3,
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 2158.0, 250.0, 440.0, 45.0 ],
                    "presentation": 1,
                    "presentation_linecount": 3,
                    "presentation_rect": [ 522.0, 172.0, 440.0, 45.0 ],
                    "text": "korpus: /Users/omerkurtulus/Documents/ChatGPT/HybridSounds/SomaxVocalMorph/corpora/Hybrid_Corpus_Source.pickle",
                    "textcolor": [ 0.043, 0.706, 0.612, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.216, 0.216, 0.251, 1.0 ],
                    "bgoncolor": [ 0.29, 0.29, 0.333, 1.0 ],
                    "fontface": 1,
                    "fontsize": 10.0,
                    "id": "ui-builder-open",
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "outputmode": 0,
                    "parameter_enable": 0,
                    "patching_rect": [ 2158.0, 100.0, 440.0, 30.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 522.0, 206.0, 440.0, 30.0 ],
                    "rounded": 6.0,
                    "text": "YENİ KORPUS OLUŞTUR (Builder penceresi)",
                    "textcolor": [ 0.882, 0.882, 0.902, 1.0 ],
                    "texton": "",
                    "textoncolor": [ 0.075, 0.075, 0.086, 1.0 ],
                    "textovercolor": [ 0.882, 0.882, 0.902, 1.0 ],
                    "truncate": 0
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.145, 0.145, 0.172, 1.0 ],
                    "border": 1,
                    "bordercolor": [ 0.271, 0.271, 0.318, 1.0 ],
                    "id": "ui-p3",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1180.0, 310.0, 120.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 24.0, 260.0, 470.0, 164.0 ],
                    "rounded": 6
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "ui-l3",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1180.0, 340.0, 300.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 40.0, 270.0, 300.0, 20.0 ],
                    "text": "3 · VOKAL DOSYASI",
                    "textcolor": [ 0.043, 0.706, 0.612, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.216, 0.216, 0.251, 1.0 ],
                    "bgoncolor": [ 0.043, 0.706, 0.612, 1.0 ],
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "ui-file-open",
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "outputmode": 0,
                    "parameter_enable": 0,
                    "patching_rect": [ 2638.0, 40.0, 225.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 40.0, 296.0, 225.0, 44.0 ],
                    "rounded": 6.0,
                    "text": "VOKAL DOSYASI SEÇ",
                    "textcolor": [ 0.882, 0.882, 0.902, 1.0 ],
                    "texton": "",
                    "textoncolor": [ 0.075, 0.075, 0.086, 1.0 ],
                    "textovercolor": [ 0.882, 0.882, 0.902, 1.0 ],
                    "truncate": 0
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.216, 0.216, 0.251, 1.0 ],
                    "bgoncolor": [ 0.043, 0.706, 0.612, 1.0 ],
                    "fontface": 1,
                    "fontsize": 13.0,
                    "id": "ui-play",
                    "maxclass": "textbutton",
                    "mode": 1,
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "outputmode": 0,
                    "parameter_enable": 0,
                    "patching_rect": [ 2638.0, 220.0, 205.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 273.0, 296.0, 205.0, 44.0 ],
                    "rounded": 6.0,
                    "text": "ÇAL",
                    "textcolor": [ 0.882, 0.882, 0.902, 1.0 ],
                    "texton": "DURDUR",
                    "textoncolor": [ 0.075, 0.075, 0.086, 1.0 ],
                    "textovercolor": [ 0.882, 0.882, 0.902, 1.0 ],
                    "truncate": 0
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.098, 0.098, 0.118, 1.0 ],
                    "bgcolor2": [ 0.098, 0.098, 0.118, 1.0 ],
                    "bgfillcolor_angle": 270.0,
                    "bgfillcolor_autogradient": 0.0,
                    "bgfillcolor_color": [ 0.098, 0.098, 0.118, 1.0 ],
                    "bgfillcolor_color1": [ 0.098, 0.098, 0.118, 1.0 ],
                    "bgfillcolor_color2": [ 0.098, 0.098, 0.118, 1.0 ],
                    "bgfillcolor_proportion": 0.39,
                    "bgfillcolor_type": "color",
                    "fontsize": 11.0,
                    "gradient": 1,
                    "id": "ui-file-status",
                    "linecount": 3,
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 2638.0, 190.0, 438.0, 45.0 ],
                    "presentation": 1,
                    "presentation_linecount": 3,
                    "presentation_rect": [ 40.0, 348.0, 438.0, 45.0 ],
                    "text": "dosya: \"Macintosh HD:/Users/omerkurtulus/Documents/ChatGPT/HybridSounds/SomaxVocalMorph/recordings/Exciter_Sax_Solo_Dry.wav\"",
                    "textcolor": [ 0.043, 0.706, 0.612, 1.0 ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 9.0,
                    "id": "ui-gain-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1180.0, 550.0, 120.0, 17.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 40.0, 384.0, 110.0, 17.0 ],
                    "text": "GİRİŞ SEVİYESİ",
                    "textcolor": [ 0.596, 0.6, 0.647, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.145, 0.145, 0.172, 1.0 ],
                    "border": 1,
                    "bordercolor": [ 0.271, 0.271, 0.318, 1.0 ],
                    "id": "ui-p4",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1180.0, 370.0, 120.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 506.0, 260.0, 470.0, 164.0 ],
                    "rounded": 6
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "ui-l4",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1180.0, 400.0, 300.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 522.0, 270.0, 300.0, 20.0 ],
                    "text": "4 · SES KARAKTERİ",
                    "textcolor": [ 0.98, 0.616, 0.106, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.216, 0.216, 0.251, 1.0 ],
                    "bgoncolor": [ 0.98, 0.616, 0.106, 1.0 ],
                    "fontface": 1,
                    "fontsize": 11.0,
                    "id": "ui-w1",
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "outputmode": 0,
                    "parameter_enable": 0,
                    "patching_rect": [ 3116.0, 40.0, 143.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 522.0, 296.0, 143.0, 44.0 ],
                    "rounded": 6.0,
                    "text": "VOKAL ODAKLI",
                    "textcolor": [ 0.882, 0.882, 0.902, 1.0 ],
                    "texton": "",
                    "textoncolor": [ 0.075, 0.075, 0.086, 1.0 ],
                    "textovercolor": [ 0.882, 0.882, 0.902, 1.0 ],
                    "truncate": 0
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.216, 0.216, 0.251, 1.0 ],
                    "bgoncolor": [ 0.98, 0.616, 0.106, 1.0 ],
                    "fontface": 1,
                    "fontsize": 11.0,
                    "id": "ui-w2",
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "outputmode": 0,
                    "parameter_enable": 0,
                    "patching_rect": [ 3116.0, 70.0, 143.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 673.0, 296.0, 143.0, 44.0 ],
                    "rounded": 6.0,
                    "text": "DOKU ODAKLI",
                    "textcolor": [ 0.882, 0.882, 0.902, 1.0 ],
                    "texton": "",
                    "textoncolor": [ 0.075, 0.075, 0.086, 1.0 ],
                    "textovercolor": [ 0.882, 0.882, 0.902, 1.0 ],
                    "truncate": 0
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.216, 0.216, 0.251, 1.0 ],
                    "bgoncolor": [ 0.98, 0.616, 0.106, 1.0 ],
                    "fontface": 1,
                    "fontsize": 11.0,
                    "id": "ui-w3",
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "outputmode": 0,
                    "parameter_enable": 0,
                    "patching_rect": [ 3116.0, 100.0, 138.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 824.0, 296.0, 138.0, 44.0 ],
                    "rounded": 6.0,
                    "text": "DENGELİ",
                    "textcolor": [ 0.882, 0.882, 0.902, 1.0 ],
                    "texton": "",
                    "textoncolor": [ 0.075, 0.075, 0.086, 1.0 ],
                    "textovercolor": [ 0.882, 0.882, 0.902, 1.0 ],
                    "truncate": 0
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 9.0,
                    "id": "ui-h4",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1180.0, 430.0, 362.0, 27.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 522.0, 344.0, 533.0, 17.0 ],
                    "text": "Vokal odaklı: girişe hızlı tepki · Doku odaklı: renk/doku · Dengeli: ortası. Perdesiz exciter (darbuka) için DOKU ODAKLI + VURMALI.",
                    "textcolor": [ 0.596, 0.6, 0.647, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.216, 0.216, 0.251, 1.0 ],
                    "bgoncolor": [ 0.29, 0.29, 0.333, 1.0 ],
                    "fontface": 1,
                    "fontsize": 10.0,
                    "id": "ui-adv",
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "outputmode": 0,
                    "parameter_enable": 0,
                    "patching_rect": [ 3116.0, 130.0, 440.0, 30.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 522.0, 388.0, 216.0, 30.0 ],
                    "rounded": 6.0,
                    "text": "SOMAX PLAYER PENCERESİ",
                    "textcolor": [ 0.882, 0.882, 0.902, 1.0 ],
                    "texton": "",
                    "textoncolor": [ 0.075, 0.075, 0.086, 1.0 ],
                    "textovercolor": [ 0.882, 0.882, 0.902, 1.0 ],
                    "truncate": 0
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.145, 0.145, 0.172, 1.0 ],
                    "border": 1,
                    "bordercolor": [ 0.271, 0.271, 0.318, 1.0 ],
                    "id": "ui-p5",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1180.0, 460.0, 120.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 24.0, 436.0, 470.0, 108.0 ],
                    "rounded": 6
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "ui-l5",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1180.0, 490.0, 300.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 40.0, 446.0, 300.0, 20.0 ],
                    "text": "5 · SESİ AÇ",
                    "textcolor": [ 0.902, 0.298, 0.294, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.216, 0.216, 0.251, 1.0 ],
                    "bgoncolor": [ 0.902, 0.298, 0.294, 1.0 ],
                    "fontface": 1,
                    "fontsize": 14.0,
                    "id": "ui-sound",
                    "maxclass": "textbutton",
                    "mode": 1,
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "outputmode": 0,
                    "parameter_enable": 0,
                    "patching_rect": [ 3596.0, 40.0, 270.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 40.0, 472.0, 240.0, 50.0 ],
                    "rounded": 6.0,
                    "text": "SES KAPALI",
                    "textcolor": [ 0.882, 0.882, 0.902, 1.0 ],
                    "texton": "SES AÇIK",
                    "textoncolor": [ 0.075, 0.075, 0.086, 1.0 ],
                    "textovercolor": [ 0.882, 0.882, 0.902, 1.0 ],
                    "truncate": 0
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 9.0,
                    "id": "ui-h5",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1180.0, 520.0, 260.0, 27.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 40.0, 526.0, 440.0, 17.0 ],
                    "text": "Patch her açılışta sessiz başlar. 1-4 tamam değilse ses gelmez.",
                    "textcolor": [ 0.596, 0.6, 0.647, 1.0 ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 10.0,
                    "id": "ui-status",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1180.0, 580.0, 460.0, 29.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 24.0, 762.0, 952.0, 18.0 ],
                    "text": "AKIŞ:  1 SUNUCU  →  2 KORPUS  →  3 EXCITER DOSYASI  →  4 KARAKTER  →  5 SESİ AÇ  →  7 KATMANLAR  →  6 KAYIT",
                    "textcolor": [ 0.596, 0.6, 0.647, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "ui-meter",
                    "maxclass": "meter~",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 3596.0, 70.0, 286.0, 28.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 292.0, 486.0, 186.0, 22.0 ]
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "srv-init-msg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1680.0, 100.0, 120.0, 21.0 ],
                    "text": "initialize"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "srv-reload-msg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1680.0, 130.0, 120.0, 21.0 ],
                    "text": "reload"
                }
            },
            {
                "box": {
                    "id": "srv-status-unpack",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "int", "" ],
                    "patching_rect": [ 1680.0, 160.0, 110.0, 22.0 ],
                    "text": "unpack 0 s"
                }
            },
            {
                "box": {
                    "id": "srv-status-prep",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1680.0, 190.0, 110.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "corpus-load-prepend",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 2158.0, 130.0, 114.0, 22.0 ],
                    "text": "prepend corpus"
                }
            },
            {
                "box": {
                    "id": "corpus-name-strip",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 2158.0, 160.0, 149.0, 22.0 ],
                    "text": "prepend set korpus:"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "corpus-err-msg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 2158.0, 190.0, 332.0, 21.0 ],
                    "text": "set HATA: lütfen build edilmiş .pickle dosyasını seç"
                }
            },
            {
                "box": {
                    "id": "corpus-folder-show",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 2158.0, 220.0, 149.0, 22.0 ],
                    "text": "prepend set klasor:"
                }
            },
            {
                "box": {
                    "id": "ui-file-dialog",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "patching_rect": [ 2638.0, 70.0, 110.0, 22.0 ],
                    "text": "opendialog"
                }
            },
            {
                "box": {
                    "id": "ui-file-t",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 2638.0, 100.0, 110.0, 22.0 ],
                    "text": "t s s"
                }
            },
            {
                "box": {
                    "id": "ui-file-open-prep",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 2638.0, 130.0, 110.0, 22.0 ],
                    "text": "prepend open"
                }
            },
            {
                "box": {
                    "id": "ui-file-show",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 2638.0, 160.0, 142.0, 22.0 ],
                    "text": "prepend set dosya:"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "adv-openwindow",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 3116.0, 160.0, 120.0, 21.0 ],
                    "text": "openwindow"
                }
            },
            {
                "box": {
                    "id": "qs-trigger",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "bang" ],
                    "patching_rect": [ 3922.0, 40.0, 110.0, 22.0 ],
                    "text": "t b b"
                }
            },
            {
                "box": {
                    "id": "qs-delay",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 3922.0, 70.0, 110.0, 22.0 ],
                    "text": "delay 2500"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "qs-player-msg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 3922.0, 130.0, 620.0, 21.0 ],
                    "text": "router 1 source VocalInfluencer, router 1 enable 1, router 1 pitch 1, router 1 onset 1, weights 0.4 0.2 0.1 0.5 0.3 0.4, enabled 1"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "qs-server-msg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 3922.0, 100.0, 120.0, 21.0 ],
                    "text": "active 1"
                }
            },
            {
                "box": {
                    "id": "snd-t",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "int", "int" ],
                    "patching_rect": [ 4460.0, 40.0, 140.0, 22.0 ],
                    "text": "t i i"
                }
            },
            {
                "box": {
                    "id": "snd-sel",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 3,
                    "outlettype": [ "bang", "bang", "" ],
                    "patching_rect": [ 4460.0, 70.0, 140.0, 22.0 ],
                    "text": "sel 1 0"
                }
            },
            {
                "box": {
                    "id": "dsp-start-msg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4460.0, 100.0, 80.0, 22.0 ],
                    "text": "start"
                }
            },
            {
                "box": {
                    "id": "dsp-cancel-msg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4460.0, 130.0, 80.0, 22.0 ],
                    "text": "stop"
                }
            },
            {
                "box": {
                    "id": "snd-stop-delay",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 4460.0, 160.0, 140.0, 22.0 ],
                    "text": "delay 250"
                }
            },
            {
                "box": {
                    "id": "dsp-stop-msg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4460.0, 190.0, 80.0, 22.0 ],
                    "text": "stop"
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "dsp-note",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 4460.0, 220.0, 240.0, 40.0 ],
                    "text": "SES ACIK: once DSP start, sonra 50 ms master ramp. SES KAPALI: ramp iner, 250 ms sonra DSP stop."
                }
            },
            {
                "box": {
                    "id": "obj-loop1",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 310.0, 60.0, 66.0, 22.0 ],
                    "text": "loadbang",
                    "varname": "file-loop-loadbang"
                }
            },
            {
                "box": {
                    "id": "obj-loop2",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 310.0, 90.0, 48.0, 22.0 ],
                    "text": "loop 1",
                    "varname": "file-loop-msg"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.145, 0.145, 0.172, 1.0 ],
                    "border": 1,
                    "bordercolor": [ 0.271, 0.271, 0.318, 1.0 ],
                    "id": "ui-p6",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1180.0, 620.0, 120.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 506.0, 436.0, 470.0, 108.0 ],
                    "rounded": 6
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "ui-l6",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1180.0, 650.0, 300.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 522.0, 446.0, 300.0, 20.0 ],
                    "text": "6 · KAYIT",
                    "textcolor": [ 0.651, 0.42, 0.91, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.216, 0.216, 0.251, 1.0 ],
                    "bgoncolor": [ 0.651, 0.42, 0.91, 1.0 ],
                    "fontface": 1,
                    "fontsize": 14.0,
                    "id": "ui-record",
                    "maxclass": "textbutton",
                    "mode": 1,
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "outputmode": 0,
                    "parameter_enable": 0,
                    "patching_rect": [ 1180.0, 680.0, 270.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 522.0, 472.0, 240.0, 50.0 ],
                    "rounded": 6.0,
                    "text": "KAYIT BAŞLAT",
                    "textcolor": [ 0.882, 0.882, 0.902, 1.0 ],
                    "texton": "KAYIT SÜRÜYOR — DURDUR",
                    "textoncolor": [ 0.075, 0.075, 0.086, 1.0 ],
                    "textovercolor": [ 0.882, 0.882, 0.902, 1.0 ],
                    "truncate": 0
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.098, 0.098, 0.118, 1.0 ],
                    "bgcolor2": [ 0.098, 0.098, 0.118, 1.0 ],
                    "bgfillcolor_angle": 270.0,
                    "bgfillcolor_autogradient": 0.0,
                    "bgfillcolor_color": [ 0.098, 0.098, 0.118, 1.0 ],
                    "bgfillcolor_color1": [ 0.098, 0.098, 0.118, 1.0 ],
                    "bgfillcolor_color2": [ 0.098, 0.098, 0.118, 1.0 ],
                    "bgfillcolor_proportion": 0.39,
                    "bgfillcolor_type": "color",
                    "fontsize": 12.0,
                    "gradient": 1,
                    "id": "ui-rec-time",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1180.0, 710.0, 140.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 770.0, 474.0, 192.0, 22.0 ],
                    "text": "süre: 348.9",
                    "textcolor": [ 0.651, 0.42, 0.91, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.098, 0.098, 0.118, 1.0 ],
                    "bgcolor2": [ 0.098, 0.098, 0.118, 1.0 ],
                    "bgfillcolor_angle": 270.0,
                    "bgfillcolor_autogradient": 0.0,
                    "bgfillcolor_color": [ 0.098, 0.098, 0.118, 1.0 ],
                    "bgfillcolor_color1": [ 0.098, 0.098, 0.118, 1.0 ],
                    "bgfillcolor_color2": [ 0.098, 0.098, 0.118, 1.0 ],
                    "bgfillcolor_proportion": 0.39,
                    "bgfillcolor_type": "color",
                    "fontsize": 12.0,
                    "gradient": 1,
                    "id": "ui-rec-status",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1180.0, 740.0, 480.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 770.0, 500.0, 192.0, 22.0 ],
                    "text": "kayıt: durdu — dosya yazıldı",
                    "textcolor": [ 0.596, 0.6, 0.647, 1.0 ]
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 9.0,
                    "id": "ui-h6",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1180.0, 770.0, 266.0, 27.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 522.0, 526.0, 440.0, 17.0 ],
                    "text": "KAYIT 4 KANAL:  1-2 master stereo  ·  3 Somax kuru  ·  4 exciter",
                    "textcolor": [ 0.596, 0.6, 0.647, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "rec-sel",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 3,
                    "outlettype": [ "bang", "bang", "" ],
                    "patching_rect": [ 1400.0, 40.0, 60.0, 22.0 ],
                    "text": "sel 1 0"
                }
            },
            {
                "box": {
                    "id": "rec-start-t",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "bang", "bang", "bang" ],
                    "patching_rect": [ 1400.0, 80.0, 66.0, 22.0 ],
                    "text": "t b b b"
                }
            },
            {
                "box": {
                    "id": "rec-samptype",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1620.0, 120.0, 110.0, 22.0 ],
                    "text": "samptype int24"
                }
            },
            {
                "box": {
                    "id": "rec-name-js",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 1480.0, 120.0, 150.0, 22.0 ],
                    "saved_object_attributes": {
                        "filename": "vocalmorph_take.js",
                        "parameter_enable": 0
                    },
                    "text": "js vocalmorph_take.js"
                }
            },
            {
                "box": {
                    "id": "rec-open-prep",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1480.0, 160.0, 90.0, 22.0 ],
                    "text": "prepend open"
                }
            },
            {
                "box": {
                    "id": "rec-name-show",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1780.0, 160.0, 120.0, 22.0 ],
                    "text": "prepend set kayıt:"
                }
            },
            {
                "box": {
                    "id": "rec-go-msg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1400.0, 200.0, 30.0, 22.0 ],
                    "text": "1"
                }
            },
            {
                "box": {
                    "id": "rec-stop-msg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1240.0, 120.0, 30.0, 22.0 ],
                    "text": "0"
                }
            },
            {
                "box": {
                    "id": "rec-stopped-show",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1240.0, 160.0, 190.0, 22.0 ],
                    "text": "set kayıt: durdu — dosya yazıldı"
                }
            },
            {
                "box": {
                    "id": "rec-sfrecord",
                    "maxclass": "newobj",
                    "numinlets": 4,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 1400.0, 240.0, 100.0, 22.0 ],
                    "text": "sfrecord~ 4"
                }
            },
            {
                "box": {
                    "id": "rec-snap",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 1400.0, 280.0, 100.0, 22.0 ],
                    "text": "snapshot~ 250"
                }
            },
            {
                "box": {
                    "id": "rec-sec",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1400.0, 320.0, 140.0, 22.0 ],
                    "text": "expr int($f1/100.)/10."
                }
            },
            {
                "box": {
                    "id": "rec-time-prep",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1400.0, 360.0, 110.0, 22.0 ],
                    "text": "prepend set süre:"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.216, 0.216, 0.251, 1.0 ],
                    "bgoncolor": [ 0.98, 0.616, 0.106, 1.0 ],
                    "fontface": 1,
                    "fontsize": 10.0,
                    "id": "ui-exciter-mode",
                    "maxclass": "textbutton",
                    "mode": 1,
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "outputmode": 0,
                    "parameter_enable": 0,
                    "patching_rect": [ 3116.0, 180.0, 440.0, 30.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 522.0, 362.0, 440.0, 22.0 ],
                    "rounded": 6.0,
                    "text": "EXCITER: PERDELİ (yin~)",
                    "textcolor": [ 0.882, 0.882, 0.902, 1.0 ],
                    "texton": "EXCITER: VURMALI (bonk~)",
                    "textoncolor": [ 0.075, 0.075, 0.086, 1.0 ],
                    "textovercolor": [ 0.882, 0.882, 0.902, 1.0 ],
                    "truncate": 0
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.216, 0.216, 0.251, 1.0 ],
                    "bgoncolor": [ 0.29, 0.29, 0.333, 1.0 ],
                    "fontface": 1,
                    "fontsize": 10.0,
                    "id": "ui-influencer",
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "outputmode": 0,
                    "parameter_enable": 0,
                    "patching_rect": [ 3116.0, 220.0, 216.0, 30.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 746.0, 388.0, 216.0, 30.0 ],
                    "rounded": 6.0,
                    "text": "INFLUENCER PENCERESİ",
                    "textcolor": [ 0.882, 0.882, 0.902, 1.0 ],
                    "texton": "",
                    "textoncolor": [ 0.075, 0.075, 0.086, 1.0 ],
                    "textovercolor": [ 0.882, 0.882, 0.902, 1.0 ],
                    "truncate": 0
                }
            },
            {
                "box": {
                    "id": "exc-sel",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 3,
                    "outlettype": [ "bang", "bang", "" ],
                    "patching_rect": [ 3116.0, 260.0, 60.0, 22.0 ],
                    "text": "sel 1 0"
                }
            },
            {
                "box": {
                    "id": "exc-bonk-msg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 3116.0, 300.0, 110.0, 22.0 ],
                    "text": "onsetmethod 1"
                }
            },
            {
                "box": {
                    "id": "exc-yin-msg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 3240.0, 300.0, 110.0, 22.0 ],
                    "text": "onsetmethod 2"
                }
            },
            {
                "box": {
                    "id": "infl-openwindow",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 3370.0, 300.0, 90.0, 22.0 ],
                    "text": "openwindow"
                }
            },
            {
                "box": {
                    "id": "v2-send-som",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 4200.0, 40.0, 120.0, 22.0 ],
                    "text": "send~ hm.som"
                }
            },
            {
                "box": {
                    "id": "v2-send-exc",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 4200.0, 66.0, 120.0, 22.0 ],
                    "text": "send~ hm.exc"
                }
            },
            {
                "box": {
                    "id": "v2-buf-gr",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "float", "bang" ],
                    "patching_rect": [ 4200.0, 92.0, 161.0, 22.0 ],
                    "text": "buffer~ hm.grain 4000 1"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.145, 0.145, 0.172, 1.0 ],
                    "border": 1,
                    "bordercolor": [ 0.271, 0.271, 0.318, 1.0 ],
                    "id": "ui-p7",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 4200.0, 118.0, 120.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 24.0, 556.0, 952.0, 196.0 ],
                    "rounded": 6
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "ui-l7",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 4200.0, 144.0, 203.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 40.0, 566.0, 400.0, 20.0 ],
                    "text": "7 · KATMANLAR — canlı aç/kapa",
                    "textcolor": [ 0.353, 0.784, 0.788, 1.0 ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 10.0,
                    "id": "ui-s0-t",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 4200.0, 170.0, 81.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 40.0, 590.0, 218.0, 18.0 ],
                    "text": "DRY — SOMAX",
                    "textcolor": [ 0.882, 0.882, 0.902, 1.0 ]
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 8.0,
                    "id": "ui-s0-h",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 4200.0, 196.0, 147.0, 15.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 40.0, 737.0, 218.0, 15.0 ],
                    "text": "Somax'ın kuru çıkışı.",
                    "textcolor": [ 0.596, 0.6, 0.647, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.216, 0.216, 0.251, 1.0 ],
                    "bgoncolor": [ 0.353, 0.784, 0.788, 1.0 ],
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "ui-dry-mute",
                    "maxclass": "textbutton",
                    "mode": 1,
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "outputmode": 0,
                    "parameter_enable": 0,
                    "patching_rect": [ 4200.0, 222.0, 180.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 40.0, 610.0, 218.0, 36.0 ],
                    "rounded": 6.0,
                    "text": "DRY KAPALI",
                    "textcolor": [ 0.882, 0.882, 0.902, 1.0 ],
                    "texton": "DRY AÇIK",
                    "textoncolor": [ 0.075, 0.075, 0.086, 1.0 ],
                    "textovercolor": [ 0.882, 0.882, 0.902, 1.0 ],
                    "truncate": 0
                }
            },
            {
                "box": {
                    "id": "ui-dry-lvl",
                    "maxclass": "dial",
                    "needlecolor": [ 0.353, 0.784, 0.788, 1.0 ],
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "outlinecolor": [ 0.271, 0.271, 0.318, 1.0 ],
                    "parameter_enable": 0,
                    "patching_rect": [ 4200.0, 248.0, 46.0, 46.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 48.0, 676.0, 46.0, 46.0 ]
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 8.0,
                    "id": "ui-dry-lvl-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 4200.0, 274.0, 80.0, 15.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 44.0, 722.0, 62.0, 15.0 ],
                    "text": "SEVİYE",
                    "textcolor": [ 0.596, 0.6, 0.647, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "v2-dry-scale",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4200.0, 300.0, 126.0, 22.0 ],
                    "text": "scale 0 127 0. 1.4"
                }
            },
            {
                "box": {
                    "id": "v2-dry-pak",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4200.0, 326.0, 120.0, 22.0 ],
                    "text": "pak 0. 0."
                }
            },
            {
                "box": {
                    "id": "v2-dry-mul",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4200.0, 352.0, 120.0, 22.0 ],
                    "text": "expr $f1 * $f2"
                }
            },
            {
                "box": {
                    "id": "v2-dry-ramp",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4200.0, 378.0, 90.0, 22.0 ],
                    "text": "$1 30"
                }
            },
            {
                "box": {
                    "id": "v2-dry-line",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "bang" ],
                    "patching_rect": [ 4200.0, 404.0, 120.0, 22.0 ],
                    "text": "line~"
                }
            },
            {
                "box": {
                    "id": "v2-dry-g",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 4200.0, 430.0, 120.0, 22.0 ],
                    "text": "*~"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 10.0,
                    "id": "ui-s1-t",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 4200.0, 456.0, 84.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 274.0, 590.0, 218.0, 18.0 ],
                    "text": "1 · GRANÜLER",
                    "textcolor": [ 0.882, 0.882, 0.902, 1.0 ]
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 8.0,
                    "id": "ui-s1-h",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 4200.0, 482.0, 259.0, 15.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 274.0, 737.0, 218.0, 15.0 ],
                    "text": "Son 4 saniyeyi tane tane geri sağlar.",
                    "textcolor": [ 0.596, 0.6, 0.647, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.216, 0.216, 0.251, 1.0 ],
                    "bgoncolor": [ 0.353, 0.784, 0.788, 1.0 ],
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "ui-l1-mute",
                    "maxclass": "textbutton",
                    "mode": 1,
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "outputmode": 0,
                    "parameter_enable": 0,
                    "patching_rect": [ 4200.0, 508.0, 180.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 274.0, 610.0, 218.0, 36.0 ],
                    "rounded": 6.0,
                    "text": "GRANÜLER KAPALI",
                    "textcolor": [ 0.882, 0.882, 0.902, 1.0 ],
                    "texton": "GRANÜLER AÇIK",
                    "textoncolor": [ 0.075, 0.075, 0.086, 1.0 ],
                    "textovercolor": [ 0.882, 0.882, 0.902, 1.0 ],
                    "truncate": 0
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.216, 0.216, 0.251, 1.0 ],
                    "bgoncolor": [ 0.949, 0.706, 0.302, 1.0 ],
                    "fontface": 1,
                    "fontsize": 9.0,
                    "id": "ui-l1-src",
                    "maxclass": "textbutton",
                    "mode": 1,
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "outputmode": 0,
                    "parameter_enable": 0,
                    "patching_rect": [ 4200.0, 534.0, 180.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 274.0, 650.0, 218.0, 20.0 ],
                    "rounded": 6.0,
                    "text": "KAYNAK: SOMAX",
                    "textcolor": [ 0.882, 0.882, 0.902, 1.0 ],
                    "texton": "KAYNAK: EXCITER",
                    "textoncolor": [ 0.075, 0.075, 0.086, 1.0 ],
                    "textovercolor": [ 0.882, 0.882, 0.902, 1.0 ],
                    "truncate": 0
                }
            },
            {
                "box": {
                    "id": "ui-l1-lvl",
                    "maxclass": "dial",
                    "needlecolor": [ 0.353, 0.784, 0.788, 1.0 ],
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "outlinecolor": [ 0.271, 0.271, 0.318, 1.0 ],
                    "parameter_enable": 0,
                    "patching_rect": [ 4200.0, 560.0, 46.0, 46.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 282.0, 676.0, 46.0, 46.0 ]
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 8.0,
                    "id": "ui-l1-lvl-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 4200.0, 586.0, 80.0, 15.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 278.0, 722.0, 62.0, 15.0 ],
                    "text": "SEVİYE",
                    "textcolor": [ 0.596, 0.6, 0.647, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "ui-l1-rate",
                    "maxclass": "dial",
                    "needlecolor": [ 0.353, 0.784, 0.788, 1.0 ],
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "outlinecolor": [ 0.271, 0.271, 0.318, 1.0 ],
                    "parameter_enable": 0,
                    "patching_rect": [ 4200.0, 612.0, 46.0, 46.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 354.0, 676.0, 46.0, 46.0 ]
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 8.0,
                    "id": "ui-l1-rate-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 4200.0, 638.0, 80.0, 15.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 350.0, 722.0, 62.0, 15.0 ],
                    "text": "HIZ Hz",
                    "textcolor": [ 0.596, 0.6, 0.647, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "ui-l1-pitch",
                    "maxclass": "dial",
                    "needlecolor": [ 0.353, 0.784, 0.788, 1.0 ],
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "outlinecolor": [ 0.271, 0.271, 0.318, 1.0 ],
                    "parameter_enable": 0,
                    "patching_rect": [ 4200.0, 664.0, 46.0, 46.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 426.0, 676.0, 46.0, 46.0 ]
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 8.0,
                    "id": "ui-l1-pitch-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 4200.0, 690.0, 80.0, 15.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 422.0, 722.0, 62.0, 15.0 ],
                    "text": "PERDE",
                    "textcolor": [ 0.596, 0.6, 0.647, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "v2-l1-scale",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4200.0, 716.0, 126.0, 22.0 ],
                    "text": "scale 0 127 0. 1.4"
                }
            },
            {
                "box": {
                    "id": "v2-l1-pak",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4200.0, 742.0, 120.0, 22.0 ],
                    "text": "pak 0. 0."
                }
            },
            {
                "box": {
                    "id": "v2-l1-mul",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4200.0, 768.0, 120.0, 22.0 ],
                    "text": "expr $f1 * $f2"
                }
            },
            {
                "box": {
                    "id": "v2-l1-ramp",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4200.0, 794.0, 90.0, 22.0 ],
                    "text": "$1 30"
                }
            },
            {
                "box": {
                    "id": "v2-l1-line",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "bang" ],
                    "patching_rect": [ 4200.0, 820.0, 120.0, 22.0 ],
                    "text": "line~"
                }
            },
            {
                "box": {
                    "id": "v2-l1-g",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 4200.0, 846.0, 120.0, 22.0 ],
                    "text": "*~"
                }
            },
            {
                "box": {
                    "id": "v2-l1-rsom",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 4200.0, 872.0, 120.0, 22.0 ],
                    "text": "receive~ hm.som"
                }
            },
            {
                "box": {
                    "id": "v2-l1-rexc",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 4200.0, 898.0, 120.0, 22.0 ],
                    "text": "receive~ hm.exc"
                }
            },
            {
                "box": {
                    "id": "v2-l1-sel",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 4200.0, 924.0, 120.0, 22.0 ],
                    "text": "selector~ 2"
                }
            },
            {
                "box": {
                    "id": "v2-l1-srcinc",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 4200.0, 950.0, 120.0, 22.0 ],
                    "text": "+ 1"
                }
            },
            {
                "box": {
                    "id": "v2-l1-srclb",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 4200.0, 976.0, 120.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "v2-l1-srcmsg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4200.0, 1002.0, 90.0, 22.0 ],
                    "text": "1"
                }
            },
            {
                "box": {
                    "id": "v2-l1-rec",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 4200.0, 1028.0, 168.0, 22.0 ],
                    "text": "record~ hm.grain @loop 1"
                }
            },
            {
                "box": {
                    "id": "v2-l1-reclb",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 4200.0, 1054.0, 120.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "v2-l1-recmsg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4200.0, 1080.0, 90.0, 22.0 ],
                    "text": "1"
                }
            },
            {
                "box": {
                    "id": "v2-l1-ratesc",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4200.0, 1106.0, 126.0, 22.0 ],
                    "text": "scale 0 127 3. 55."
                }
            },
            {
                "box": {
                    "id": "v2-l1-pitchsc",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4200.0, 1132.0, 140.0, 22.0 ],
                    "text": "scale 0 127 0.25 2."
                }
            },
            {
                "box": {
                    "id": "v2-l1-ph",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 4200.0, 1158.0, 120.0, 22.0 ],
                    "text": "phasor~ 20."
                }
            },
            {
                "box": {
                    "id": "v2-l1-invm",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 4200.0, 1184.0, 120.0, 22.0 ],
                    "text": "*~ -1."
                }
            },
            {
                "box": {
                    "id": "v2-l1-inva",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 4200.0, 1210.0, 120.0, 22.0 ],
                    "text": "+~ 1."
                }
            },
            {
                "box": {
                    "id": "v2-l1-noise",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 4200.0, 1236.0, 120.0, 22.0 ],
                    "text": "noise~"
                }
            },
            {
                "box": {
                    "id": "v2-l1-sah",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 4200.0, 1262.0, 120.0, 22.0 ],
                    "text": "sah~ 0.5"
                }
            },
            {
                "box": {
                    "id": "v2-l1-posm",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 4200.0, 1288.0, 120.0, 22.0 ],
                    "text": "*~ 0.35"
                }
            },
            {
                "box": {
                    "id": "v2-l1-posa",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 4200.0, 1314.0, 120.0, 22.0 ],
                    "text": "+~ 0.4"
                }
            },
            {
                "box": {
                    "id": "v2-l1-span",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 4200.0, 1340.0, 120.0, 22.0 ],
                    "text": "*~ 0.02"
                }
            },
            {
                "box": {
                    "id": "v2-l1-spanpak",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4200.0, 1366.0, 120.0, 22.0 ],
                    "text": "pak 20. 1."
                }
            },
            {
                "box": {
                    "id": "v2-l1-spanexp",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4200.0, 1392.0, 147.0, 22.0 ],
                    "text": "expr $f2 / ($f1 * 4.)"
                }
            },
            {
                "box": {
                    "id": "v2-l1-read",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 4200.0, 1418.0, 120.0, 22.0 ],
                    "text": "+~"
                }
            },
            {
                "box": {
                    "id": "v2-l1-wave",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 4200.0, 1444.0, 120.0, 22.0 ],
                    "text": "wave~ hm.grain"
                }
            },
            {
                "box": {
                    "id": "v2-l1-cos",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 4200.0, 1470.0, 120.0, 22.0 ],
                    "text": "cos~"
                }
            },
            {
                "box": {
                    "id": "v2-l1-winm",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 4200.0, 1496.0, 120.0, 22.0 ],
                    "text": "*~ -0.5"
                }
            },
            {
                "box": {
                    "id": "v2-l1-wina",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 4200.0, 1522.0, 120.0, 22.0 ],
                    "text": "+~ 0.5"
                }
            },
            {
                "box": {
                    "id": "v2-l1-gwin",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 4200.0, 1548.0, 120.0, 22.0 ],
                    "text": "*~"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 10.0,
                    "id": "ui-s2-t",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 4200.0, 1574.0, 80.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 508.0, 590.0, 218.0, 18.0 ],
                    "text": "2 · BULANIK",
                    "textcolor": [ 0.882, 0.882, 0.902, 1.0 ]
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 8.0,
                    "id": "ui-s2-h",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 4200.0, 1600.0, 259.0, 15.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 508.0, 737.0, 218.0, 15.0 ],
                    "text": "Geri beslemeli, modülasyonlu gecikme.",
                    "textcolor": [ 0.596, 0.6, 0.647, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.216, 0.216, 0.251, 1.0 ],
                    "bgoncolor": [ 0.353, 0.784, 0.788, 1.0 ],
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "ui-l2-mute",
                    "maxclass": "textbutton",
                    "mode": 1,
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "outputmode": 0,
                    "parameter_enable": 0,
                    "patching_rect": [ 4200.0, 1626.0, 180.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 508.0, 610.0, 218.0, 36.0 ],
                    "rounded": 6.0,
                    "text": "BULANIK KAPALI",
                    "textcolor": [ 0.882, 0.882, 0.902, 1.0 ],
                    "texton": "BULANIK AÇIK",
                    "textoncolor": [ 0.075, 0.075, 0.086, 1.0 ],
                    "textovercolor": [ 0.882, 0.882, 0.902, 1.0 ],
                    "truncate": 0
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.216, 0.216, 0.251, 1.0 ],
                    "bgoncolor": [ 0.949, 0.706, 0.302, 1.0 ],
                    "fontface": 1,
                    "fontsize": 9.0,
                    "id": "ui-l2-src",
                    "maxclass": "textbutton",
                    "mode": 1,
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "outputmode": 0,
                    "parameter_enable": 0,
                    "patching_rect": [ 4200.0, 1652.0, 180.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 508.0, 650.0, 218.0, 20.0 ],
                    "rounded": 6.0,
                    "text": "KAYNAK: SOMAX",
                    "textcolor": [ 0.882, 0.882, 0.902, 1.0 ],
                    "texton": "KAYNAK: EXCITER",
                    "textoncolor": [ 0.075, 0.075, 0.086, 1.0 ],
                    "textovercolor": [ 0.882, 0.882, 0.902, 1.0 ],
                    "truncate": 0
                }
            },
            {
                "box": {
                    "id": "ui-l2-lvl",
                    "maxclass": "dial",
                    "needlecolor": [ 0.353, 0.784, 0.788, 1.0 ],
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "outlinecolor": [ 0.271, 0.271, 0.318, 1.0 ],
                    "parameter_enable": 0,
                    "patching_rect": [ 4200.0, 1678.0, 46.0, 46.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 516.0, 676.0, 46.0, 46.0 ]
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 8.0,
                    "id": "ui-l2-lvl-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 4200.0, 1704.0, 80.0, 15.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 512.0, 722.0, 62.0, 15.0 ],
                    "text": "SEVİYE",
                    "textcolor": [ 0.596, 0.6, 0.647, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "ui-l2-fb",
                    "maxclass": "dial",
                    "needlecolor": [ 0.353, 0.784, 0.788, 1.0 ],
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "outlinecolor": [ 0.271, 0.271, 0.318, 1.0 ],
                    "parameter_enable": 0,
                    "patching_rect": [ 4200.0, 1730.0, 46.0, 46.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 588.0, 676.0, 46.0, 46.0 ]
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 8.0,
                    "id": "ui-l2-fb-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 4200.0, 1756.0, 80.0, 15.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 584.0, 722.0, 62.0, 15.0 ],
                    "text": "GERİ BES.",
                    "textcolor": [ 0.596, 0.6, 0.647, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "ui-l2-time",
                    "maxclass": "dial",
                    "needlecolor": [ 0.353, 0.784, 0.788, 1.0 ],
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "outlinecolor": [ 0.271, 0.271, 0.318, 1.0 ],
                    "parameter_enable": 0,
                    "patching_rect": [ 4200.0, 1782.0, 46.0, 46.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 660.0, 676.0, 46.0, 46.0 ]
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 8.0,
                    "id": "ui-l2-time-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 4200.0, 1808.0, 80.0, 15.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 656.0, 722.0, 62.0, 15.0 ],
                    "text": "SÜRE ms",
                    "textcolor": [ 0.596, 0.6, 0.647, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "v2-l2-scale",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4200.0, 1834.0, 126.0, 22.0 ],
                    "text": "scale 0 127 0. 1.4"
                }
            },
            {
                "box": {
                    "id": "v2-l2-pak",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4200.0, 1860.0, 120.0, 22.0 ],
                    "text": "pak 0. 0."
                }
            },
            {
                "box": {
                    "id": "v2-l2-mul",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4200.0, 1886.0, 120.0, 22.0 ],
                    "text": "expr $f1 * $f2"
                }
            },
            {
                "box": {
                    "id": "v2-l2-ramp",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4200.0, 1912.0, 90.0, 22.0 ],
                    "text": "$1 30"
                }
            },
            {
                "box": {
                    "id": "v2-l2-line",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "bang" ],
                    "patching_rect": [ 4200.0, 1938.0, 120.0, 22.0 ],
                    "text": "line~"
                }
            },
            {
                "box": {
                    "id": "v2-l2-g",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 4200.0, 1964.0, 120.0, 22.0 ],
                    "text": "*~"
                }
            },
            {
                "box": {
                    "id": "v2-l2-rsom",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 4200.0, 1990.0, 120.0, 22.0 ],
                    "text": "receive~ hm.som"
                }
            },
            {
                "box": {
                    "id": "v2-l2-rexc",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 4200.0, 2016.0, 120.0, 22.0 ],
                    "text": "receive~ hm.exc"
                }
            },
            {
                "box": {
                    "id": "v2-l2-sel",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 4200.0, 2042.0, 120.0, 22.0 ],
                    "text": "selector~ 2"
                }
            },
            {
                "box": {
                    "id": "v2-l2-srcinc",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 4200.0, 2068.0, 120.0, 22.0 ],
                    "text": "+ 1"
                }
            },
            {
                "box": {
                    "id": "v2-l2-srclb",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 4200.0, 2094.0, 120.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "v2-l2-srcmsg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4200.0, 2120.0, 90.0, 22.0 ],
                    "text": "1"
                }
            },
            {
                "box": {
                    "id": "v2-l2-tapin",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "tapconnect" ],
                    "patching_rect": [ 4200.0, 2146.0, 120.0, 22.0 ],
                    "text": "tapin~ 4000"
                }
            },
            {
                "box": {
                    "id": "v2-l2-tapout",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 4200.0, 2172.0, 120.0, 22.0 ],
                    "text": "tapout~ 600"
                }
            },
            {
                "box": {
                    "id": "v2-l2-lp",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 4200.0, 2198.0, 120.0, 22.0 ],
                    "text": "onepole~ 3800"
                }
            },
            {
                "box": {
                    "id": "v2-l2-fbmul",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 4200.0, 2224.0, 120.0, 22.0 ],
                    "text": "*~ 0."
                }
            },
            {
                "box": {
                    "id": "v2-l2-fbsc",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4200.0, 2250.0, 126.0, 22.0 ],
                    "text": "scale 0 127 0. 0.9"
                }
            },
            {
                "box": {
                    "id": "v2-l2-lfo",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 4200.0, 2276.0, 120.0, 22.0 ],
                    "text": "cycle~ 0.07"
                }
            },
            {
                "box": {
                    "id": "v2-l2-lfod",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 4200.0, 2302.0, 120.0, 22.0 ],
                    "text": "*~ 7."
                }
            },
            {
                "box": {
                    "id": "v2-l2-tadd",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 4200.0, 2328.0, 120.0, 22.0 ],
                    "text": "+~ 600."
                }
            },
            {
                "box": {
                    "id": "v2-l2-timesc",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4200.0, 2354.0, 147.0, 22.0 ],
                    "text": "scale 0 127 60. 1400."
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 10.0,
                    "id": "ui-s3-t",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 4200.0, 2380.0, 105.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 742.0, 590.0, 218.0, 18.0 ],
                    "text": "3 · NÖRAL (nn~)",
                    "textcolor": [ 0.882, 0.882, 0.902, 1.0 ]
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 8.0,
                    "id": "ui-s3-h",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 4200.0, 2406.0, 252.0, 15.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 742.0, 737.0, 218.0, 15.0 ],
                    "text": "PAHALI. Kapalıyken hiç hesap yapmaz.",
                    "textcolor": [ 0.596, 0.6, 0.647, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.216, 0.216, 0.251, 1.0 ],
                    "bgoncolor": [ 0.651, 0.42, 0.91, 1.0 ],
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "ui-l3-mute",
                    "maxclass": "textbutton",
                    "mode": 1,
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "outputmode": 0,
                    "parameter_enable": 0,
                    "patching_rect": [ 4200.0, 2432.0, 180.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 742.0, 610.0, 218.0, 36.0 ],
                    "rounded": 6.0,
                    "text": "NÖRAL KAPALI",
                    "textcolor": [ 0.882, 0.882, 0.902, 1.0 ],
                    "texton": "NÖRAL AÇIK — CPU",
                    "textoncolor": [ 0.075, 0.075, 0.086, 1.0 ],
                    "textovercolor": [ 0.882, 0.882, 0.902, 1.0 ],
                    "truncate": 0
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.216, 0.216, 0.251, 1.0 ],
                    "bgoncolor": [ 0.949, 0.706, 0.302, 1.0 ],
                    "fontface": 1,
                    "fontsize": 9.0,
                    "id": "ui-l3-src",
                    "maxclass": "textbutton",
                    "mode": 1,
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "outputmode": 0,
                    "parameter_enable": 0,
                    "patching_rect": [ 4200.0, 2458.0, 180.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 742.0, 650.0, 218.0, 20.0 ],
                    "rounded": 6.0,
                    "text": "KAYNAK: SOMAX",
                    "textcolor": [ 0.882, 0.882, 0.902, 1.0 ],
                    "texton": "KAYNAK: EXCITER",
                    "textoncolor": [ 0.075, 0.075, 0.086, 1.0 ],
                    "textovercolor": [ 0.882, 0.882, 0.902, 1.0 ],
                    "truncate": 0
                }
            },
            {
                "box": {
                    "id": "ui-l3-lvl",
                    "maxclass": "dial",
                    "needlecolor": [ 0.353, 0.784, 0.788, 1.0 ],
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "outlinecolor": [ 0.271, 0.271, 0.318, 1.0 ],
                    "parameter_enable": 0,
                    "patching_rect": [ 4200.0, 2484.0, 46.0, 46.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 750.0, 676.0, 46.0, 46.0 ]
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 8.0,
                    "id": "ui-l3-lvl-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 4200.0, 2510.0, 80.0, 15.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 746.0, 722.0, 62.0, 15.0 ],
                    "text": "SEVİYE",
                    "textcolor": [ 0.596, 0.6, 0.647, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "v2-l3-scale",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4200.0, 2536.0, 126.0, 22.0 ],
                    "text": "scale 0 127 0. 1.4"
                }
            },
            {
                "box": {
                    "id": "v2-l3-pak",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4200.0, 2562.0, 120.0, 22.0 ],
                    "text": "pak 0. 0."
                }
            },
            {
                "box": {
                    "id": "v2-l3-mul",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4200.0, 2588.0, 120.0, 22.0 ],
                    "text": "expr $f1 * $f2"
                }
            },
            {
                "box": {
                    "id": "v2-l3-ramp",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4460.0, 40.0, 90.0, 22.0 ],
                    "text": "$1 30"
                }
            },
            {
                "box": {
                    "id": "v2-l3-line",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "bang" ],
                    "patching_rect": [ 4460.0, 66.0, 120.0, 22.0 ],
                    "text": "line~"
                }
            },
            {
                "box": {
                    "id": "v2-l3-g",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 4460.0, 92.0, 120.0, 22.0 ],
                    "text": "*~"
                }
            },
            {
                "box": {
                    "id": "v2-l3-rsom",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 4460.0, 118.0, 120.0, 22.0 ],
                    "text": "receive~ hm.som"
                }
            },
            {
                "box": {
                    "id": "v2-l3-rexc",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 4460.0, 144.0, 120.0, 22.0 ],
                    "text": "receive~ hm.exc"
                }
            },
            {
                "box": {
                    "id": "v2-l3-sel",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 4460.0, 170.0, 120.0, 22.0 ],
                    "text": "selector~ 2"
                }
            },
            {
                "box": {
                    "id": "v2-l3-srcinc",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 4460.0, 196.0, 120.0, 22.0 ],
                    "text": "+ 1"
                }
            },
            {
                "box": {
                    "id": "v2-l3-srclb",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 4460.0, 222.0, 120.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "v2-l3-srcmsg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4460.0, 248.0, 90.0, 22.0 ],
                    "text": "1"
                }
            },
            {
                "box": {
                    "id": "v2-l3-nn",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 4460.0, 274.0, 175.0, 22.0 ],
                    "text": "nn~ darbouka forward 4096"
                }
            },
            {
                "box": {
                    "id": "v2-l3-en",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4460.0, 300.0, 120.0, 22.0 ],
                    "text": "prepend enable"
                }
            },
            {
                "box": {
                    "id": "v2-l3-enlb",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 4460.0, 326.0, 120.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "v2-l3-enmsg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4460.0, 352.0, 90.0, 22.0 ],
                    "text": "enable 0"
                }
            },
            {
                "box": {
                    "id": "v2-mixL",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 4460.0, 378.0, 120.0, 22.0 ],
                    "text": "+~ 0."
                }
            },
            {
                "box": {
                    "id": "v2-mixR",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 4460.0, 404.0, 120.0, 22.0 ],
                    "text": "+~ 0."
                }
            },
            {
                "box": {
                    "id": "v2-dry-pl",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 4460.0, 430.0, 120.0, 22.0 ],
                    "text": "*~ 0.7071"
                }
            },
            {
                "box": {
                    "id": "v2-dry-pr",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 4460.0, 456.0, 120.0, 22.0 ],
                    "text": "*~ 0.7071"
                }
            },
            {
                "box": {
                    "id": "v2-l1-pl",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 4460.0, 482.0, 120.0, 22.0 ],
                    "text": "*~ 0.8367"
                }
            },
            {
                "box": {
                    "id": "v2-l1-pr",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 4460.0, 508.0, 120.0, 22.0 ],
                    "text": "*~ 0.5477"
                }
            },
            {
                "box": {
                    "id": "v2-l2-pl",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 4460.0, 534.0, 120.0, 22.0 ],
                    "text": "*~ 0.5292"
                }
            },
            {
                "box": {
                    "id": "v2-l2-pr",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 4460.0, 560.0, 120.0, 22.0 ],
                    "text": "*~ 0.8485"
                }
            },
            {
                "box": {
                    "id": "v2-l3-pl",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 4460.0, 586.0, 120.0, 22.0 ],
                    "text": "*~ 0.6708"
                }
            },
            {
                "box": {
                    "id": "v2-l3-pr",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 4460.0, 612.0, 120.0, 22.0 ],
                    "text": "*~ 0.7416"
                }
            },
            {
                "box": {
                    "id": "v2-verb-send",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 4460.0, 638.0, 120.0, 22.0 ],
                    "text": "*~"
                }
            },
            {
                "box": {
                    "id": "v2-outL",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 4460.0, 664.0, 120.0, 22.0 ],
                    "text": "*~"
                }
            },
            {
                "box": {
                    "id": "v2-outR",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 4460.0, 690.0, 120.0, 22.0 ],
                    "text": "*~"
                }
            },
            {
                "box": {
                    "id": "v2-verb-damp",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 4460.0, 716.0, 120.0, 22.0 ],
                    "text": "onepole~ 4200"
                }
            },
            {
                "box": {
                    "id": "v2-verb-c0",
                    "maxclass": "newobj",
                    "numinlets": 5,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 4460.0, 742.0, 168.0, 22.0 ],
                    "text": "comb~ 60 29.7 0. 1. 0.78"
                }
            },
            {
                "box": {
                    "id": "v2-verb-c1",
                    "maxclass": "newobj",
                    "numinlets": 5,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 4460.0, 768.0, 161.0, 22.0 ],
                    "text": "comb~ 60 37.1 0. 1. 0.8"
                }
            },
            {
                "box": {
                    "id": "v2-verb-c2",
                    "maxclass": "newobj",
                    "numinlets": 5,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 4460.0, 794.0, 168.0, 22.0 ],
                    "text": "comb~ 60 41.1 0. 1. 0.76"
                }
            },
            {
                "box": {
                    "id": "v2-verb-c3",
                    "maxclass": "newobj",
                    "numinlets": 5,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 4460.0, 820.0, 168.0, 22.0 ],
                    "text": "comb~ 60 43.7 0. 1. 0.74"
                }
            },
            {
                "box": {
                    "id": "v2-verb-a1",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 4460.0, 846.0, 133.0, 22.0 ],
                    "text": "allpass~ 20 5. 0.7"
                }
            },
            {
                "box": {
                    "id": "v2-verb-a2",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 4460.0, 872.0, 133.0, 22.0 ],
                    "text": "allpass~ 20 1.7 0.7"
                }
            },
            {
                "box": {
                    "id": "v2-verb-a3",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 4460.0, 898.0, 133.0, 22.0 ],
                    "text": "allpass~ 20 6.1 0.7"
                }
            },
            {
                "box": {
                    "id": "v2-verb-a4",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 4460.0, 924.0, 133.0, 22.0 ],
                    "text": "allpass~ 20 2.3 0.7"
                }
            },
            {
                "box": {
                    "id": "v2-lim",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "signal" ],
                    "patching_rect": [ 4460.0, 950.0, 120.0, 22.0 ],
                    "text": "limi~ 2"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.145, 0.145, 0.172, 1.0 ],
                    "border": 1,
                    "bordercolor": [ 0.271, 0.271, 0.318, 1.0 ],
                    "id": "ui-p8",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 4460.0, 976.0, 120.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 992.0, 84.0, 384.0, 260.0 ],
                    "rounded": 6
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "ui-l8",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 4460.0, 1002.0, 231.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1008.0, 94.0, 340.0, 20.0 ],
                    "text": "8 · MASTER + MIDI (Akai MPK mini)",
                    "textcolor": [ 0.949, 0.706, 0.302, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "ui-verb",
                    "maxclass": "dial",
                    "needlecolor": [ 0.353, 0.784, 0.788, 1.0 ],
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "outlinecolor": [ 0.271, 0.271, 0.318, 1.0 ],
                    "parameter_enable": 0,
                    "patching_rect": [ 4460.0, 1028.0, 46.0, 46.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1008.0, 120.0, 46.0, 46.0 ]
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 8.0,
                    "id": "ui-verb-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 4460.0, 1054.0, 80.0, 15.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1004.0, 168.0, 62.0, 15.0 ],
                    "text": "REVERB",
                    "textcolor": [ 0.596, 0.6, 0.647, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "ui-mout",
                    "maxclass": "dial",
                    "needlecolor": [ 0.353, 0.784, 0.788, 1.0 ],
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "outlinecolor": [ 0.271, 0.271, 0.318, 1.0 ],
                    "parameter_enable": 0,
                    "patching_rect": [ 4460.0, 1080.0, 46.0, 46.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1080.0, 120.0, 46.0, 46.0 ]
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 8.0,
                    "id": "ui-mout-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 4460.0, 1106.0, 80.0, 15.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1076.0, 168.0, 62.0, 15.0 ],
                    "text": "MASTER",
                    "textcolor": [ 0.596, 0.6, 0.647, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "v2-verbsc",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4460.0, 1132.0, 133.0, 22.0 ],
                    "text": "scale 0 127 0. 0.32"
                }
            },
            {
                "box": {
                    "id": "v2-verbramp",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4460.0, 1158.0, 90.0, 22.0 ],
                    "text": "$1 40"
                }
            },
            {
                "box": {
                    "id": "v2-verbline",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "bang" ],
                    "patching_rect": [ 4460.0, 1184.0, 120.0, 22.0 ],
                    "text": "line~"
                }
            },
            {
                "box": {
                    "id": "v2-moutsc",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4460.0, 1210.0, 126.0, 22.0 ],
                    "text": "scale 0 127 0. 1.2"
                }
            },
            {
                "box": {
                    "id": "v2-moutramp",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4460.0, 1236.0, 90.0, 22.0 ],
                    "text": "$1 40"
                }
            },
            {
                "box": {
                    "id": "v2-moutline",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "bang" ],
                    "patching_rect": [ 4460.0, 1262.0, 120.0, 22.0 ],
                    "text": "line~"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.098, 0.098, 0.118, 1.0 ],
                    "bgcolor2": [ 0.098, 0.098, 0.118, 1.0 ],
                    "bgfillcolor_angle": 270.0,
                    "bgfillcolor_autogradient": 0.0,
                    "bgfillcolor_color": [ 0.098, 0.098, 0.118, 1.0 ],
                    "bgfillcolor_color1": [ 0.098, 0.098, 0.118, 1.0 ],
                    "bgfillcolor_color2": [ 0.098, 0.098, 0.118, 1.0 ],
                    "bgfillcolor_proportion": 0.39,
                    "bgfillcolor_type": "color",
                    "fontsize": 11.0,
                    "gradient": 1,
                    "id": "ui-midi-last",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4460.0, 1288.0, 90.0, 21.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1152.0, 122.0, 208.0, 21.0 ],
                    "text": "gelen: -",
                    "textcolor": [ 0.949, 0.706, 0.302, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.098, 0.098, 0.118, 1.0 ],
                    "fontsize": 11.0,
                    "id": "ui-padbase",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 4460.0, 1314.0, 60.0, 21.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1152.0, 152.0, 54.0, 21.0 ],
                    "textcolor": [ 0.949, 0.706, 0.302, 1.0 ],
                    "triscale": 0.9
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 8.0,
                    "id": "ui-padbase-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 4460.0, 1340.0, 80.0, 15.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1214.0, 156.0, 80.0, 15.0 ],
                    "text": "PAD NOTA",
                    "textcolor": [ 0.596, 0.6, 0.647, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.098, 0.098, 0.118, 1.0 ],
                    "fontsize": 11.0,
                    "id": "ui-knobbase",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 4460.0, 1366.0, 60.0, 21.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1152.0, 180.0, 54.0, 21.0 ],
                    "textcolor": [ 0.949, 0.706, 0.302, 1.0 ],
                    "triscale": 0.9
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 8.0,
                    "id": "ui-knobbase-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 4460.0, 1392.0, 80.0, 15.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1214.0, 184.0, 80.0, 15.0 ],
                    "text": "KNOB CC",
                    "textcolor": [ 0.596, 0.6, 0.647, 1.0 ]
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 8.5,
                    "id": "ui-midi-h",
                    "linecount": 4,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 4460.0, 1418.0, 585.0, 44.0 ],
                    "presentation": 1,
                    "presentation_linecount": 6,
                    "presentation_rect": [ 1008.0, 212.0, 352.0, 63.0 ],
                    "text": "Pad 1-4 = DRY / GRANÜLER / BULANIK / NÖRAL aç-kapa.\nKnob 1-8 = HIZ · PERDE · GERİ BES. · SÜRE · GRAN SEV. · BULANIK SEV. · REVERB · MASTER.\n\nNumaralar tutmazsa bir pada ve bir knoba bas, üstteki kutuda görünen değeri PAD NOTA / KNOB CC alanlarına yaz. MPK mini mk3 varsayılanı 36 ve 70.",
                    "textcolor": [ 0.596, 0.6, 0.647, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "v2-notein",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "int", "int" ],
                    "patching_rect": [ 4460.0, 1444.0, 120.0, 22.0 ],
                    "text": "notein"
                }
            },
            {
                "box": {
                    "id": "v2-strip",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "int", "int" ],
                    "patching_rect": [ 4460.0, 1470.0, 120.0, 22.0 ],
                    "text": "stripnote"
                }
            },
            {
                "box": {
                    "id": "v2-padshow",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4460.0, 1496.0, 161.0, 22.0 ],
                    "text": "prepend set gelen: nota"
                }
            },
            {
                "box": {
                    "id": "v2-padsub",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 4460.0, 1522.0, 120.0, 22.0 ],
                    "text": "- 36"
                }
            },
            {
                "box": {
                    "id": "v2-padlb",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 4460.0, 1548.0, 120.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "v2-padmsg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4460.0, 1574.0, 90.0, 22.0 ],
                    "text": "36"
                }
            },
            {
                "box": {
                    "id": "v2-padsel",
                    "maxclass": "newobj",
                    "numinlets": 5,
                    "numoutlets": 5,
                    "outlettype": [ "bang", "bang", "bang", "bang", "" ],
                    "patching_rect": [ 4460.0, 1600.0, 120.0, 22.0 ],
                    "text": "sel 0 1 2 3"
                }
            },
            {
                "box": {
                    "id": "v2-ctlin",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "int", "int" ],
                    "patching_rect": [ 4460.0, 1626.0, 120.0, 22.0 ],
                    "text": "ctlin"
                }
            },
            {
                "box": {
                    "id": "v2-ccshow",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4460.0, 1652.0, 147.0, 22.0 ],
                    "text": "prepend set gelen: cc"
                }
            },
            {
                "box": {
                    "id": "v2-ccsub",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 4460.0, 1678.0, 120.0, 22.0 ],
                    "text": "- 70"
                }
            },
            {
                "box": {
                    "id": "v2-knoblb",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 4460.0, 1704.0, 120.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "v2-knobmsg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4460.0, 1730.0, 90.0, 22.0 ],
                    "text": "70"
                }
            },
            {
                "box": {
                    "id": "v2-ccsplit",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 2,
                    "outlettype": [ "int", "int" ],
                    "patching_rect": [ 4460.0, 1756.0, 120.0, 22.0 ],
                    "text": "split 0 7"
                }
            },
            {
                "box": {
                    "id": "v2-ccinc",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 4460.0, 1782.0, 120.0, 22.0 ],
                    "text": "+ 1"
                }
            },
            {
                "box": {
                    "id": "v2-ccgate",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 8,
                    "outlettype": [ "", "", "", "", "", "", "", "" ],
                    "patching_rect": [ 4460.0, 1808.0, 120.0, 22.0 ],
                    "text": "gate 8"
                }
            },
            {
                "box": {
                    "id": "v2-ccclose",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4460.0, 1834.0, 90.0, 22.0 ],
                    "text": "0"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.145, 0.145, 0.172, 1.0 ],
                    "border": 1,
                    "bordercolor": [ 0.271, 0.271, 0.318, 1.0 ],
                    "id": "ui-p9",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 4460.0, 1860.0, 120.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 992.0, 356.0, 384.0, 396.0 ],
                    "rounded": 6
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "ui-l9",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 4460.0, 1886.0, 87.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1008.0, 366.0, 300.0, 20.0 ],
                    "text": "9 · OTOPİLOT",
                    "textcolor": [ 0.651, 0.42, 0.91, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.216, 0.216, 0.251, 1.0 ],
                    "bgoncolor": [ 0.651, 0.42, 0.91, 1.0 ],
                    "fontface": 1,
                    "fontsize": 13.0,
                    "id": "ui-auto",
                    "maxclass": "textbutton",
                    "mode": 1,
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "outputmode": 0,
                    "parameter_enable": 0,
                    "patching_rect": [ 4460.0, 1912.0, 180.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1008.0, 392.0, 352.0, 44.0 ],
                    "rounded": 6.0,
                    "text": "OTOPİLOT KAPALI",
                    "textcolor": [ 0.882, 0.882, 0.902, 1.0 ],
                    "texton": "OTOPİLOT ÇALIŞIYOR",
                    "textoncolor": [ 0.075, 0.075, 0.086, 1.0 ],
                    "textovercolor": [ 0.882, 0.882, 0.902, 1.0 ],
                    "truncate": 0
                }
            },
            {
                "box": {
                    "id": "ui-a-act",
                    "maxclass": "dial",
                    "needlecolor": [ 0.353, 0.784, 0.788, 1.0 ],
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "outlinecolor": [ 0.271, 0.271, 0.318, 1.0 ],
                    "parameter_enable": 0,
                    "patching_rect": [ 4460.0, 1938.0, 46.0, 46.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1008.0, 448.0, 46.0, 46.0 ]
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 8.0,
                    "id": "ui-a-act-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 4460.0, 1964.0, 80.0, 15.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1004.0, 496.0, 62.0, 15.0 ],
                    "text": "HAREKET",
                    "textcolor": [ 0.596, 0.6, 0.647, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.098, 0.098, 0.118, 1.0 ],
                    "fontsize": 11.0,
                    "id": "ui-seed",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 4460.0, 1990.0, 60.0, 21.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1080.0, 452.0, 60.0, 21.0 ],
                    "textcolor": [ 0.949, 0.706, 0.302, 1.0 ],
                    "triscale": 0.9
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 8.0,
                    "id": "ui-seed-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 4460.0, 2016.0, 80.0, 15.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1080.0, 476.0, 70.0, 15.0 ],
                    "text": "TOHUM",
                    "textcolor": [ 0.596, 0.6, 0.647, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.216, 0.216, 0.251, 1.0 ],
                    "bgoncolor": [ 0.949, 0.706, 0.302, 1.0 ],
                    "fontface": 1,
                    "fontsize": 10.0,
                    "id": "ui-seed-new",
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "outputmode": 0,
                    "parameter_enable": 0,
                    "patching_rect": [ 4460.0, 2042.0, 180.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1156.0, 450.0, 120.0, 26.0 ],
                    "rounded": 6.0,
                    "text": "YENİ TOHUM",
                    "textcolor": [ 0.882, 0.882, 0.902, 1.0 ],
                    "texton": "YENİ TOHUM",
                    "textoncolor": [ 0.075, 0.075, 0.086, 1.0 ],
                    "textovercolor": [ 0.882, 0.882, 0.902, 1.0 ],
                    "truncate": 0
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 8.5,
                    "id": "ui-h9a",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 4460.0, 2068.0, 112.0, 16.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1008.0, 520.0, 140.0, 16.0 ],
                    "text": "OTOMASYONA DAHİL",
                    "textcolor": [ 0.882, 0.882, 0.902, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "ui-opt-dry",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 4460.0, 2094.0, 24.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1008.0, 538.0, 18.0, 18.0 ]
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 8.0,
                    "id": "ui-opt-dry-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 4460.0, 2120.0, 80.0, 15.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1030.0, 540.0, 52.0, 15.0 ],
                    "text": "DRY",
                    "textcolor": [ 0.596, 0.6, 0.647, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "ui-opt-l1",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 4460.0, 2146.0, 24.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1090.0, 538.0, 18.0, 18.0 ]
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 8.0,
                    "id": "ui-opt-l1-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 4460.0, 2172.0, 80.0, 15.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1112.0, 540.0, 52.0, 15.0 ],
                    "text": "GRAN",
                    "textcolor": [ 0.596, 0.6, 0.647, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "ui-opt-l2",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 4460.0, 2198.0, 24.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1178.0, 538.0, 18.0, 18.0 ]
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 8.0,
                    "id": "ui-opt-l2-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 4460.0, 2224.0, 80.0, 15.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1200.0, 540.0, 52.0, 15.0 ],
                    "text": "BUL",
                    "textcolor": [ 0.596, 0.6, 0.647, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "ui-opt-l3",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 4460.0, 2250.0, 24.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1256.0, 538.0, 18.0, 18.0 ]
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 8.0,
                    "id": "ui-opt-l3-l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 4460.0, 2276.0, 80.0, 15.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1278.0, 540.0, 52.0, 15.0 ],
                    "text": "NÖR",
                    "textcolor": [ 0.596, 0.6, 0.647, 1.0 ]
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 8.5,
                    "id": "ui-h9",
                    "linecount": 9,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 4460.0, 2302.0, 623.0, 92.0 ],
                    "presentation": 1,
                    "presentation_linecount": 12,
                    "presentation_rect": [ 1008.0, 566.0, 352.0, 120.0 ],
                    "text": "Katmanları kendi kendine gezdirir: seviyeler yavaş (15-45 sn), tını parametreleri orta (4-12 sn), aç/kapa seyrek (20-90 sn). Zamanlama asimetrik, ızgaraya oturmaz.\n\nHAREKET: hem adım büyüklüğünü hem tempoyu belirler.\n\nTOHUM: aynı sayı aynı hareket dizisini verir. KAYIT BAŞLAT'a bastığında otopilot kendini sıfırlar, yani her take'in başı aynı yerden başlar.\n\nDört katmanın hepsi birden kapanırsa DRY otomatik geri açılır — take'in ortasında kaza sessizliği olmaz.\n\nNÖRAL varsayılan olarak dahil DEĞİL; otopilot onu açıp CPU'yu habersiz yormasın diye.",
                    "textcolor": [ 0.596, 0.6, 0.647, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "v2-a-actsc",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4460.0, 2328.0, 120.0, 22.0 ],
                    "text": "scale 0 127 0. 1."
                }
            },
            {
                "box": {
                    "id": "v2-a-stepsc",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4460.0, 2354.0, 120.0, 22.0 ],
                    "text": "scale 0 127 6 40"
                }
            },
            {
                "box": {
                    "id": "v2-a-slow-metro",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 4460.0, 2380.0, 120.0, 22.0 ],
                    "text": "metro 30000"
                }
            },
            {
                "box": {
                    "id": "v2-a-slow-t",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "bang" ],
                    "patching_rect": [ 4460.0, 2406.0, 120.0, 22.0 ],
                    "text": "t b b"
                }
            },
            {
                "box": {
                    "id": "v2-a-slow-rnd",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4460.0, 2432.0, 120.0, 22.0 ],
                    "text": "random 30000"
                }
            },
            {
                "box": {
                    "id": "v2-a-slow-int",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4460.0, 2458.0, 266.0, 22.0 ],
                    "text": "expr ($i1 + 15000) * (2.2 - 1.7 * $f2)"
                }
            },
            {
                "box": {
                    "id": "v2-a-mid-metro",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 4460.0, 2484.0, 120.0, 22.0 ],
                    "text": "metro 8000"
                }
            },
            {
                "box": {
                    "id": "v2-a-mid-t",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "bang" ],
                    "patching_rect": [ 4460.0, 2510.0, 120.0, 22.0 ],
                    "text": "t b b"
                }
            },
            {
                "box": {
                    "id": "v2-a-mid-rnd",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4460.0, 2536.0, 120.0, 22.0 ],
                    "text": "random 8000"
                }
            },
            {
                "box": {
                    "id": "v2-a-mid-int",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4460.0, 2562.0, 259.0, 22.0 ],
                    "text": "expr ($i1 + 4000) * (2.2 - 1.7 * $f2)"
                }
            },
            {
                "box": {
                    "id": "v2-a-rare-metro",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 4460.0, 2588.0, 120.0, 22.0 ],
                    "text": "metro 55000"
                }
            },
            {
                "box": {
                    "id": "v2-a-rare-t",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "bang" ],
                    "patching_rect": [ 4720.0, 40.0, 120.0, 22.0 ],
                    "text": "t b b"
                }
            },
            {
                "box": {
                    "id": "v2-a-rare-rnd",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 66.0, 120.0, 22.0 ],
                    "text": "random 70000"
                }
            },
            {
                "box": {
                    "id": "v2-a-rare-int",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 92.0, 266.0, 22.0 ],
                    "text": "expr ($i1 + 20000) * (2.2 - 1.7 * $f2)"
                }
            },
            {
                "box": {
                    "id": "v2-a-g-lvl-dry",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 118.0, 120.0, 22.0 ],
                    "text": "gate"
                }
            },
            {
                "box": {
                    "id": "v2-a-dr-lvl-dry",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 144.0, 120.0, 22.0 ],
                    "text": "drunk 128 20"
                }
            },
            {
                "box": {
                    "id": "v2-a-pk-lvl-dry",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 170.0, 120.0, 22.0 ],
                    "text": "pack 0 12000"
                }
            },
            {
                "box": {
                    "id": "v2-a-ln-lvl-dry",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "patching_rect": [ 4720.0, 196.0, 120.0, 22.0 ],
                    "text": "line 0. 60"
                }
            },
            {
                "box": {
                    "id": "v2-a-g-lvl-l1",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 222.0, 120.0, 22.0 ],
                    "text": "gate"
                }
            },
            {
                "box": {
                    "id": "v2-a-dr-lvl-l1",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 248.0, 120.0, 22.0 ],
                    "text": "drunk 128 20"
                }
            },
            {
                "box": {
                    "id": "v2-a-pk-lvl-l1",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 274.0, 120.0, 22.0 ],
                    "text": "pack 0 12000"
                }
            },
            {
                "box": {
                    "id": "v2-a-ln-lvl-l1",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "patching_rect": [ 4720.0, 300.0, 120.0, 22.0 ],
                    "text": "line 0. 60"
                }
            },
            {
                "box": {
                    "id": "v2-a-g-lvl-l2",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 326.0, 120.0, 22.0 ],
                    "text": "gate"
                }
            },
            {
                "box": {
                    "id": "v2-a-dr-lvl-l2",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 352.0, 120.0, 22.0 ],
                    "text": "drunk 128 20"
                }
            },
            {
                "box": {
                    "id": "v2-a-pk-lvl-l2",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 378.0, 120.0, 22.0 ],
                    "text": "pack 0 12000"
                }
            },
            {
                "box": {
                    "id": "v2-a-ln-lvl-l2",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "patching_rect": [ 4720.0, 404.0, 120.0, 22.0 ],
                    "text": "line 0. 60"
                }
            },
            {
                "box": {
                    "id": "v2-a-g-lvl-l3",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 430.0, 120.0, 22.0 ],
                    "text": "gate"
                }
            },
            {
                "box": {
                    "id": "v2-a-dr-lvl-l3",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 456.0, 120.0, 22.0 ],
                    "text": "drunk 128 20"
                }
            },
            {
                "box": {
                    "id": "v2-a-pk-lvl-l3",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 482.0, 120.0, 22.0 ],
                    "text": "pack 0 12000"
                }
            },
            {
                "box": {
                    "id": "v2-a-ln-lvl-l3",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "patching_rect": [ 4720.0, 508.0, 120.0, 22.0 ],
                    "text": "line 0. 60"
                }
            },
            {
                "box": {
                    "id": "v2-a-g-mid-l1",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 534.0, 120.0, 22.0 ],
                    "text": "gate"
                }
            },
            {
                "box": {
                    "id": "v2-a-g-mid-l2",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 560.0, 120.0, 22.0 ],
                    "text": "gate"
                }
            },
            {
                "box": {
                    "id": "v2-a-dr-rate",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 586.0, 120.0, 22.0 ],
                    "text": "drunk 128 20"
                }
            },
            {
                "box": {
                    "id": "v2-a-pk-rate",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 612.0, 120.0, 22.0 ],
                    "text": "pack 0 3500"
                }
            },
            {
                "box": {
                    "id": "v2-a-ln-rate",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "patching_rect": [ 4720.0, 638.0, 120.0, 22.0 ],
                    "text": "line 0. 60"
                }
            },
            {
                "box": {
                    "id": "v2-a-dr-pitch",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 664.0, 120.0, 22.0 ],
                    "text": "drunk 128 20"
                }
            },
            {
                "box": {
                    "id": "v2-a-pk-pitch",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 690.0, 120.0, 22.0 ],
                    "text": "pack 0 3500"
                }
            },
            {
                "box": {
                    "id": "v2-a-ln-pitch",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "patching_rect": [ 4720.0, 716.0, 120.0, 22.0 ],
                    "text": "line 0. 60"
                }
            },
            {
                "box": {
                    "id": "v2-a-dr-fb",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 742.0, 120.0, 22.0 ],
                    "text": "drunk 128 20"
                }
            },
            {
                "box": {
                    "id": "v2-a-pk-fb",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 768.0, 120.0, 22.0 ],
                    "text": "pack 0 3500"
                }
            },
            {
                "box": {
                    "id": "v2-a-ln-fb",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "patching_rect": [ 4720.0, 794.0, 120.0, 22.0 ],
                    "text": "line 0. 60"
                }
            },
            {
                "box": {
                    "id": "v2-a-dr-time",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 820.0, 120.0, 22.0 ],
                    "text": "drunk 128 20"
                }
            },
            {
                "box": {
                    "id": "v2-a-pk-time",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 846.0, 120.0, 22.0 ],
                    "text": "pack 0 3500"
                }
            },
            {
                "box": {
                    "id": "v2-a-ln-time",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "patching_rect": [ 4720.0, 872.0, 120.0, 22.0 ],
                    "text": "line 0. 60"
                }
            },
            {
                "box": {
                    "id": "v2-a-dr-verb",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 898.0, 120.0, 22.0 ],
                    "text": "drunk 128 20"
                }
            },
            {
                "box": {
                    "id": "v2-a-pk-verb",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 924.0, 120.0, 22.0 ],
                    "text": "pack 0 9000"
                }
            },
            {
                "box": {
                    "id": "v2-a-ln-verb",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "patching_rect": [ 4720.0, 950.0, 120.0, 22.0 ],
                    "text": "line 0. 60"
                }
            },
            {
                "box": {
                    "id": "v2-a-mrnd",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 976.0, 120.0, 22.0 ],
                    "text": "random 4"
                }
            },
            {
                "box": {
                    "id": "v2-a-msel",
                    "maxclass": "newobj",
                    "numinlets": 5,
                    "numoutlets": 5,
                    "outlettype": [ "bang", "bang", "bang", "bang", "" ],
                    "patching_rect": [ 4720.0, 1002.0, 120.0, 22.0 ],
                    "text": "sel 0 1 2 3"
                }
            },
            {
                "box": {
                    "id": "v2-a-g-mute-dry",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 1028.0, 120.0, 22.0 ],
                    "text": "gate"
                }
            },
            {
                "box": {
                    "id": "v2-a-g-mute-l1",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 1054.0, 120.0, 22.0 ],
                    "text": "gate"
                }
            },
            {
                "box": {
                    "id": "v2-a-g-mute-l2",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 1080.0, 120.0, 22.0 ],
                    "text": "gate"
                }
            },
            {
                "box": {
                    "id": "v2-a-g-mute-l3",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 1106.0, 120.0, 22.0 ],
                    "text": "gate"
                }
            },
            {
                "box": {
                    "id": "v2-a-sum",
                    "maxclass": "newobj",
                    "numinlets": 4,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 1132.0, 120.0, 22.0 ],
                    "text": "pak 0 0 0 0"
                }
            },
            {
                "box": {
                    "id": "v2-a-sumx",
                    "maxclass": "newobj",
                    "numinlets": 4,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 1158.0, 182.0, 22.0 ],
                    "text": "expr $i1 + $i2 + $i3 + $i4"
                }
            },
            {
                "box": {
                    "id": "v2-a-zero",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "" ],
                    "patching_rect": [ 4720.0, 1184.0, 120.0, 22.0 ],
                    "text": "sel 0"
                }
            },
            {
                "box": {
                    "id": "v2-a-dryon",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 1210.0, 90.0, 22.0 ],
                    "text": "1"
                }
            },
            {
                "box": {
                    "id": "v2-a-seedt",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "int" ],
                    "patching_rect": [ 4720.0, 1236.0, 120.0, 22.0 ],
                    "text": "t b i"
                }
            },
            {
                "box": {
                    "id": "v2-a-seedset",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 1262.0, 90.0, 22.0 ],
                    "text": "seed $1"
                }
            },
            {
                "box": {
                    "id": "v2-a-seedgen",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 1288.0, 120.0, 22.0 ],
                    "text": "random 32000"
                }
            },
            {
                "box": {
                    "id": "v2-a-seednz",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 4720.0, 1314.0, 120.0, 22.0 ],
                    "text": "+ 1"
                }
            },
            {
                "box": {
                    "id": "v2-a-uzi",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 3,
                    "outlettype": [ "bang", "bang", "int" ],
                    "patching_rect": [ 4720.0, 1340.0, 120.0, 22.0 ],
                    "text": "uzi 13"
                }
            },
            {
                "box": {
                    "id": "v2-a-seedgate",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 13,
                    "outlettype": [ "", "", "", "", "", "", "", "", "", "", "", "", "" ],
                    "patching_rect": [ 4720.0, 1366.0, 120.0, 22.0 ],
                    "text": "gate 13"
                }
            },
            {
                "box": {
                    "id": "v2-a-sm0",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 1392.0, 90.0, 22.0 ],
                    "text": "seed $1"
                }
            },
            {
                "box": {
                    "id": "v2-a-sm1",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 1418.0, 90.0, 22.0 ],
                    "text": "seed $1"
                }
            },
            {
                "box": {
                    "id": "v2-a-sm2",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 1444.0, 90.0, 22.0 ],
                    "text": "seed $1"
                }
            },
            {
                "box": {
                    "id": "v2-a-sm3",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 1470.0, 90.0, 22.0 ],
                    "text": "seed $1"
                }
            },
            {
                "box": {
                    "id": "v2-a-sm4",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 1496.0, 90.0, 22.0 ],
                    "text": "seed $1"
                }
            },
            {
                "box": {
                    "id": "v2-a-sm5",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 1522.0, 90.0, 22.0 ],
                    "text": "seed $1"
                }
            },
            {
                "box": {
                    "id": "v2-a-sm6",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 1548.0, 90.0, 22.0 ],
                    "text": "seed $1"
                }
            },
            {
                "box": {
                    "id": "v2-a-sm7",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 1574.0, 90.0, 22.0 ],
                    "text": "seed $1"
                }
            },
            {
                "box": {
                    "id": "v2-a-sm8",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 1600.0, 90.0, 22.0 ],
                    "text": "seed $1"
                }
            },
            {
                "box": {
                    "id": "v2-a-sm9",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 1626.0, 90.0, 22.0 ],
                    "text": "seed $1"
                }
            },
            {
                "box": {
                    "id": "v2-a-sm10",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 1652.0, 90.0, 22.0 ],
                    "text": "seed $1"
                }
            },
            {
                "box": {
                    "id": "v2-a-sm11",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 1678.0, 90.0, 22.0 ],
                    "text": "seed $1"
                }
            },
            {
                "box": {
                    "id": "v2-a-sm12",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 1704.0, 90.0, 22.0 ],
                    "text": "seed $1"
                }
            },
            {
                "box": {
                    "id": "v2-a-newrnd",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 1730.0, 120.0, 22.0 ],
                    "text": "random 9999"
                }
            },
            {
                "box": {
                    "id": "v2-a-clocklb",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 4720.0, 1756.0, 120.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "v2-a-clockdel",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 4720.0, 1782.0, 120.0, 22.0 ],
                    "text": "delay 900"
                }
            },
            {
                "box": {
                    "id": "v2-a-cpu",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 4720.0, 1808.0, 120.0, 22.0 ],
                    "text": "cpuclock"
                }
            },
            {
                "box": {
                    "id": "v2-a-cpui",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 1834.0, 147.0, 22.0 ],
                    "text": "expr int($f1) % 30011"
                }
            },
            {
                "box": {
                    "id": "v2-a-cpuseed",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 1860.0, 90.0, 22.0 ],
                    "text": "seed $1"
                }
            },
            {
                "box": {
                    "id": "v2-a-recsel",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "" ],
                    "patching_rect": [ 4720.0, 1886.0, 120.0, 22.0 ],
                    "text": "sel 1"
                }
            },
            {
                "box": {
                    "id": "v2-a-rect",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "bang" ],
                    "patching_rect": [ 4720.0, 1912.0, 120.0, 22.0 ],
                    "text": "t b b"
                }
            },
            {
                "box": {
                    "id": "v2-a-rs0",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 1938.0, 90.0, 22.0 ],
                    "text": "100"
                }
            },
            {
                "box": {
                    "id": "v2-a-rs1",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 1964.0, 90.0, 22.0 ],
                    "text": "40"
                }
            },
            {
                "box": {
                    "id": "v2-a-rs2",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 1990.0, 90.0, 22.0 ],
                    "text": "40"
                }
            },
            {
                "box": {
                    "id": "v2-a-rs3",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 2016.0, 90.0, 22.0 ],
                    "text": "30"
                }
            },
            {
                "box": {
                    "id": "v2-a-rs4",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 2042.0, 90.0, 22.0 ],
                    "text": "55"
                }
            },
            {
                "box": {
                    "id": "v2-a-rs5",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 2068.0, 90.0, 22.0 ],
                    "text": "54"
                }
            },
            {
                "box": {
                    "id": "v2-a-rs6",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 2094.0, 90.0, 22.0 ],
                    "text": "62"
                }
            },
            {
                "box": {
                    "id": "v2-a-rs7",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 2120.0, 90.0, 22.0 ],
                    "text": "45"
                }
            },
            {
                "box": {
                    "id": "v2-a-rs8",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 2146.0, 90.0, 22.0 ],
                    "text": "34"
                }
            },
            {
                "box": {
                    "id": "v2-init-lb",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 4720.0, 2172.0, 120.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "v2-init-del",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 4720.0, 2198.0, 120.0, 22.0 ],
                    "text": "delay 400"
                }
            },
            {
                "box": {
                    "id": "v2-init-0",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 2224.0, 90.0, 22.0 ],
                    "text": "100"
                }
            },
            {
                "box": {
                    "id": "v2-init-1",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 2250.0, 90.0, 22.0 ],
                    "text": "0"
                }
            },
            {
                "box": {
                    "id": "v2-init-2",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 2276.0, 90.0, 22.0 ],
                    "text": "0"
                }
            },
            {
                "box": {
                    "id": "v2-init-3",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 2302.0, 90.0, 22.0 ],
                    "text": "0"
                }
            },
            {
                "box": {
                    "id": "v2-init-4",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 2328.0, 90.0, 22.0 ],
                    "text": "55"
                }
            },
            {
                "box": {
                    "id": "v2-init-5",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 2354.0, 90.0, 22.0 ],
                    "text": "54"
                }
            },
            {
                "box": {
                    "id": "v2-init-6",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 2380.0, 90.0, 22.0 ],
                    "text": "62"
                }
            },
            {
                "box": {
                    "id": "v2-init-7",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 2406.0, 90.0, 22.0 ],
                    "text": "45"
                }
            },
            {
                "box": {
                    "id": "v2-init-8",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 2432.0, 90.0, 22.0 ],
                    "text": "34"
                }
            },
            {
                "box": {
                    "id": "v2-init-9",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 2458.0, 90.0, 22.0 ],
                    "text": "106"
                }
            },
            {
                "box": {
                    "id": "v2-init-10",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 2484.0, 90.0, 22.0 ],
                    "text": "1"
                }
            },
            {
                "box": {
                    "id": "v2-init-11",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 2510.0, 90.0, 22.0 ],
                    "text": "1"
                }
            },
            {
                "box": {
                    "id": "v2-init-12",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 2536.0, 90.0, 22.0 ],
                    "text": "55"
                }
            },
            {
                "box": {
                    "id": "v2-init-13",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 2562.0, 90.0, 22.0 ],
                    "text": "1"
                }
            },
            {
                "box": {
                    "id": "v2-init-14",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4720.0, 2588.0, 90.0, 22.0 ],
                    "text": "1"
                }
            },
            {
                "box": {
                    "id": "v2-init-15",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4980.0, 40.0, 90.0, 22.0 ],
                    "text": "1"
                }
            },
            {
                "box": {
                    "id": "v2-init-16",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4980.0, 66.0, 90.0, 22.0 ],
                    "text": "0"
                }
            },
            {
                "box": {
                    "id": "v2-init-seeddel",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 4980.0, 92.0, 120.0, 22.0 ],
                    "text": "delay 700"
                }
            },
            {
                "box": {
                    "id": "v2-init-seed",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 4980.0, 118.0, 90.0, 22.0 ],
                    "text": "7"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "player-app", 0 ],
                    "source": [ "adv-openwindow", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "file-mixdown", 0 ],
                    "source": [ "audio-corpus-builder", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "audio-corpus-builder", 0 ],
                    "source": [ "builder-build-prepend", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "builder-open-msg", 0 ],
                    "source": [ "builder-open-button", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "audio-corpus-builder", 0 ],
                    "source": [ "builder-open-msg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "builder-source-dialog", 0 ],
                    "source": [ "builder-source-button", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "builder-build-prepend", 0 ],
                    "source": [ "builder-source-dialog", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-corpus-status", 0 ],
                    "source": [ "corpus-err-msg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "corpus-file-dialog", 0 ],
                    "source": [ "corpus-file-button", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "corpus-file-guard", 0 ],
                    "source": [ "corpus-file-dialog", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "corpus-err-msg", 0 ],
                    "source": [ "corpus-file-guard", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "corpus-load-prepend", 0 ],
                    "order": 1,
                    "source": [ "corpus-file-guard", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "corpus-name-strip", 0 ],
                    "order": 0,
                    "source": [ "corpus-file-guard", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "corpus-folder-dialog", 0 ],
                    "source": [ "corpus-folder-button", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "corpus-folder-prepend", 0 ],
                    "order": 1,
                    "source": [ "corpus-folder-dialog", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "corpus-folder-show", 0 ],
                    "order": 0,
                    "source": [ "corpus-folder-dialog", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "server-app", 0 ],
                    "source": [ "corpus-folder-prepend", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-corpus-status", 0 ],
                    "source": [ "corpus-folder-show", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "player-app", 0 ],
                    "source": [ "corpus-load-prepend", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-corpus-status", 0 ],
                    "source": [ "corpus-name-strip", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "snd-stop-delay", 0 ],
                    "source": [ "dsp-cancel-msg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "audio-dsp", 0 ],
                    "source": [ "dsp-start-msg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "audio-dsp", 0 ],
                    "source": [ "dsp-stop-msg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "audio-influencer-app", 0 ],
                    "source": [ "exc-bonk-msg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "exc-bonk-msg", 0 ],
                    "source": [ "exc-sel", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "exc-yin-msg", 0 ],
                    "source": [ "exc-sel", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "audio-influencer-app", 0 ],
                    "source": [ "exc-yin-msg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "input-gain", 0 ],
                    "source": [ "file-mixdown", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "file-player", 0 ],
                    "source": [ "file-open-msg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "file-player", 0 ],
                    "source": [ "file-play-toggle", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "file-mixdown", 0 ],
                    "source": [ "file-player", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "file-mixdown", 0 ],
                    "source": [ "file-player", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "audio-influencer-app", 0 ],
                    "source": [ "infl-openwindow", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "audio-influencer-app", 0 ],
                    "order": 2,
                    "source": [ "input-gain", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rec-sfrecord", 3 ],
                    "order": 1,
                    "source": [ "input-gain", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-send-exc", 0 ],
                    "order": 0,
                    "source": [ "input-gain", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "master-mul", 0 ],
                    "source": [ "master-clip", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "master-toggle", 0 ],
                    "source": [ "master-load-zero", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rec-sfrecord", 2 ],
                    "order": 2,
                    "source": [ "master-mul", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-dry-g", 0 ],
                    "order": 0,
                    "source": [ "master-mul", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-send-som", 0 ],
                    "order": 1,
                    "source": [ "master-mul", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "master-mul", 1 ],
                    "source": [ "master-ramp-line", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "master-ramp-line", 0 ],
                    "source": [ "master-ramp-msg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "master-ramp-msg", 0 ],
                    "source": [ "master-toggle", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-loop2", 0 ],
                    "source": [ "obj-loop1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "file-player", 0 ],
                    "source": [ "obj-loop2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "player-mixdown", 0 ],
                    "source": [ "player-app", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "player-unpack", 0 ],
                    "source": [ "player-mixdown", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "master-clip", 0 ],
                    "source": [ "player-unpack", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "qs-player-msg", 0 ],
                    "order": 0,
                    "source": [ "qs-delay", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "qs-server-msg", 0 ],
                    "order": 1,
                    "source": [ "qs-delay", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "player-app", 0 ],
                    "source": [ "qs-player-msg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "server-app", 0 ],
                    "source": [ "qs-server-msg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "qs-delay", 0 ],
                    "source": [ "qs-trigger", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "srv-init-msg", 0 ],
                    "source": [ "qs-trigger", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rec-sfrecord", 0 ],
                    "source": [ "rec-go-msg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rec-name-show", 0 ],
                    "source": [ "rec-name-js", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rec-open-prep", 0 ],
                    "source": [ "rec-name-js", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-rec-status", 0 ],
                    "source": [ "rec-name-show", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rec-sfrecord", 0 ],
                    "source": [ "rec-open-prep", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rec-sfrecord", 0 ],
                    "source": [ "rec-samptype", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rec-time-prep", 0 ],
                    "source": [ "rec-sec", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rec-start-t", 0 ],
                    "source": [ "rec-sel", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rec-stop-msg", 0 ],
                    "order": 1,
                    "source": [ "rec-sel", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rec-stopped-show", 0 ],
                    "order": 0,
                    "source": [ "rec-sel", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rec-snap", 0 ],
                    "source": [ "rec-sfrecord", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rec-sec", 0 ],
                    "source": [ "rec-snap", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rec-go-msg", 0 ],
                    "source": [ "rec-start-t", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rec-name-js", 0 ],
                    "source": [ "rec-start-t", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rec-samptype", 0 ],
                    "source": [ "rec-start-t", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rec-sfrecord", 0 ],
                    "source": [ "rec-stop-msg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-rec-status", 0 ],
                    "source": [ "rec-stopped-show", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-rec-time", 0 ],
                    "source": [ "rec-time-prep", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "srv-status-unpack", 0 ],
                    "source": [ "server-app", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "dsp-cancel-msg", 0 ],
                    "order": 0,
                    "source": [ "snd-sel", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "dsp-start-msg", 0 ],
                    "order": 1,
                    "source": [ "snd-sel", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "snd-stop-delay", 0 ],
                    "source": [ "snd-sel", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "dsp-stop-msg", 0 ],
                    "source": [ "snd-stop-delay", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "master-toggle", 0 ],
                    "source": [ "snd-t", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "snd-sel", 0 ],
                    "source": [ "snd-t", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "server-app", 0 ],
                    "source": [ "srv-init-msg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "server-app", 0 ],
                    "source": [ "srv-reload-msg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-srv-status", 0 ],
                    "source": [ "srv-status-prep", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "srv-status-prep", 0 ],
                    "source": [ "srv-status-unpack", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-actsc", 0 ],
                    "order": 1,
                    "source": [ "ui-a-act", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-stepsc", 0 ],
                    "order": 0,
                    "source": [ "ui-a-act", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "adv-openwindow", 0 ],
                    "source": [ "ui-adv", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-mid-metro", 0 ],
                    "order": 1,
                    "source": [ "ui-auto", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-rare-metro", 0 ],
                    "order": 0,
                    "source": [ "ui-auto", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-slow-metro", 0 ],
                    "order": 2,
                    "source": [ "ui-auto", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "builder-open-button", 0 ],
                    "source": [ "ui-builder-open", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "corpus-folder-button", 0 ],
                    "source": [ "ui-corpus-folder", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "corpus-file-button", 0 ],
                    "source": [ "ui-corpus-load", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-dry-scale", 0 ],
                    "source": [ "ui-dry-lvl", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-sum", 0 ],
                    "order": 0,
                    "source": [ "ui-dry-mute", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-dry-pak", 1 ],
                    "order": 1,
                    "source": [ "ui-dry-mute", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "exc-sel", 0 ],
                    "source": [ "ui-exciter-mode", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-file-t", 0 ],
                    "source": [ "ui-file-dialog", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-file-dialog", 0 ],
                    "source": [ "ui-file-open", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "file-player", 0 ],
                    "source": [ "ui-file-open-prep", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-file-status", 0 ],
                    "source": [ "ui-file-show", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-file-open-prep", 0 ],
                    "source": [ "ui-file-t", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-file-show", 0 ],
                    "source": [ "ui-file-t", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "infl-openwindow", 0 ],
                    "source": [ "ui-influencer", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-ccsub", 1 ],
                    "source": [ "ui-knobbase", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l1-scale", 0 ],
                    "source": [ "ui-l1-lvl", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-sum", 1 ],
                    "order": 0,
                    "source": [ "ui-l1-mute", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l1-pak", 1 ],
                    "order": 1,
                    "source": [ "ui-l1-mute", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l1-pitchsc", 0 ],
                    "source": [ "ui-l1-pitch", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l1-ratesc", 0 ],
                    "source": [ "ui-l1-rate", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l1-srcinc", 0 ],
                    "source": [ "ui-l1-src", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l2-fbsc", 0 ],
                    "source": [ "ui-l2-fb", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l2-scale", 0 ],
                    "source": [ "ui-l2-lvl", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-sum", 2 ],
                    "order": 0,
                    "source": [ "ui-l2-mute", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l2-pak", 1 ],
                    "order": 1,
                    "source": [ "ui-l2-mute", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l2-srcinc", 0 ],
                    "source": [ "ui-l2-src", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l2-timesc", 0 ],
                    "source": [ "ui-l2-time", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l3-scale", 0 ],
                    "source": [ "ui-l3-lvl", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-sum", 3 ],
                    "order": 0,
                    "source": [ "ui-l3-mute", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l3-en", 0 ],
                    "order": 1,
                    "source": [ "ui-l3-mute", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l3-pak", 1 ],
                    "order": 2,
                    "source": [ "ui-l3-mute", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l3-srcinc", 0 ],
                    "source": [ "ui-l3-src", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-moutsc", 0 ],
                    "source": [ "ui-mout", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-g-lvl-dry", 0 ],
                    "order": 1,
                    "source": [ "ui-opt-dry", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-g-mute-dry", 0 ],
                    "order": 0,
                    "source": [ "ui-opt-dry", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-g-lvl-l1", 0 ],
                    "order": 2,
                    "source": [ "ui-opt-l1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-g-mid-l1", 0 ],
                    "order": 1,
                    "source": [ "ui-opt-l1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-g-mute-l1", 0 ],
                    "order": 0,
                    "source": [ "ui-opt-l1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-g-lvl-l2", 0 ],
                    "order": 2,
                    "source": [ "ui-opt-l2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-g-mid-l2", 0 ],
                    "order": 1,
                    "source": [ "ui-opt-l2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-g-mute-l2", 0 ],
                    "order": 0,
                    "source": [ "ui-opt-l2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-g-lvl-l3", 0 ],
                    "order": 1,
                    "source": [ "ui-opt-l3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-g-mute-l3", 0 ],
                    "order": 0,
                    "source": [ "ui-opt-l3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-padsub", 1 ],
                    "source": [ "ui-padbase", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "file-play-toggle", 0 ],
                    "source": [ "ui-play", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "qs-trigger", 0 ],
                    "source": [ "ui-quickstart", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rec-sel", 0 ],
                    "order": 1,
                    "source": [ "ui-record", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-recsel", 0 ],
                    "order": 0,
                    "source": [ "ui-record", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-seedt", 0 ],
                    "source": [ "ui-seed", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-newrnd", 0 ],
                    "source": [ "ui-seed-new", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "snd-t", 0 ],
                    "source": [ "ui-sound", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "srv-reload-msg", 0 ],
                    "source": [ "ui-srv-reload", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "srv-init-msg", 0 ],
                    "source": [ "ui-srv-start", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-verbsc", 0 ],
                    "source": [ "ui-verb", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "w-vocal-led", 0 ],
                    "source": [ "ui-w1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "w-texture-led", 0 ],
                    "source": [ "ui-w2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "w-balanced", 0 ],
                    "source": [ "ui-w3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-mid-int", 1 ],
                    "order": 2,
                    "source": [ "v2-a-actsc", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-rare-int", 1 ],
                    "order": 0,
                    "source": [ "v2-a-actsc", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-slow-int", 1 ],
                    "order": 1,
                    "source": [ "v2-a-actsc", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-cpu", 0 ],
                    "source": [ "v2-a-clockdel", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-clockdel", 0 ],
                    "source": [ "v2-a-clocklb", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-cpui", 0 ],
                    "source": [ "v2-a-cpu", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-cpuseed", 0 ],
                    "source": [ "v2-a-cpui", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-newrnd", 0 ],
                    "source": [ "v2-a-cpuseed", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-pk-fb", 0 ],
                    "source": [ "v2-a-dr-fb", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-pk-lvl-dry", 0 ],
                    "source": [ "v2-a-dr-lvl-dry", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-pk-lvl-l1", 0 ],
                    "source": [ "v2-a-dr-lvl-l1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-pk-lvl-l2", 0 ],
                    "source": [ "v2-a-dr-lvl-l2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-pk-lvl-l3", 0 ],
                    "source": [ "v2-a-dr-lvl-l3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-pk-pitch", 0 ],
                    "source": [ "v2-a-dr-pitch", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-pk-rate", 0 ],
                    "source": [ "v2-a-dr-rate", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-pk-time", 0 ],
                    "source": [ "v2-a-dr-time", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-pk-verb", 0 ],
                    "source": [ "v2-a-dr-verb", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-dry-mute", 0 ],
                    "source": [ "v2-a-dryon", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-dr-lvl-dry", 0 ],
                    "source": [ "v2-a-g-lvl-dry", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-dr-lvl-l1", 0 ],
                    "source": [ "v2-a-g-lvl-l1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-dr-lvl-l2", 0 ],
                    "source": [ "v2-a-g-lvl-l2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-dr-lvl-l3", 0 ],
                    "source": [ "v2-a-g-lvl-l3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-dr-pitch", 0 ],
                    "order": 0,
                    "source": [ "v2-a-g-mid-l1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-dr-rate", 0 ],
                    "order": 1,
                    "source": [ "v2-a-g-mid-l1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-dr-fb", 0 ],
                    "order": 1,
                    "source": [ "v2-a-g-mid-l2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-dr-time", 0 ],
                    "order": 0,
                    "source": [ "v2-a-g-mid-l2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-dry-mute", 0 ],
                    "source": [ "v2-a-g-mute-dry", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-l1-mute", 0 ],
                    "source": [ "v2-a-g-mute-l1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-l2-mute", 0 ],
                    "source": [ "v2-a-g-mute-l2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-l3-mute", 0 ],
                    "source": [ "v2-a-g-mute-l3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-l2-fb", 0 ],
                    "source": [ "v2-a-ln-fb", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-dry-lvl", 0 ],
                    "source": [ "v2-a-ln-lvl-dry", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-l1-lvl", 0 ],
                    "source": [ "v2-a-ln-lvl-l1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-l2-lvl", 0 ],
                    "source": [ "v2-a-ln-lvl-l2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-l3-lvl", 0 ],
                    "source": [ "v2-a-ln-lvl-l3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-l1-pitch", 0 ],
                    "source": [ "v2-a-ln-pitch", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-l1-rate", 0 ],
                    "source": [ "v2-a-ln-rate", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-l2-time", 0 ],
                    "source": [ "v2-a-ln-time", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-verb", 0 ],
                    "source": [ "v2-a-ln-verb", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-mid-metro", 1 ],
                    "source": [ "v2-a-mid-int", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-mid-t", 0 ],
                    "source": [ "v2-a-mid-metro", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-mid-int", 0 ],
                    "source": [ "v2-a-mid-rnd", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-g-mid-l1", 1 ],
                    "order": 1,
                    "source": [ "v2-a-mid-t", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-g-mid-l2", 1 ],
                    "order": 0,
                    "source": [ "v2-a-mid-t", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-mid-rnd", 0 ],
                    "source": [ "v2-a-mid-t", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-msel", 0 ],
                    "source": [ "v2-a-mrnd", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-g-mute-dry", 1 ],
                    "source": [ "v2-a-msel", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-g-mute-l1", 1 ],
                    "source": [ "v2-a-msel", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-g-mute-l2", 1 ],
                    "source": [ "v2-a-msel", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-g-mute-l3", 1 ],
                    "source": [ "v2-a-msel", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-seed", 0 ],
                    "source": [ "v2-a-newrnd", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-ln-fb", 0 ],
                    "source": [ "v2-a-pk-fb", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-ln-lvl-dry", 0 ],
                    "source": [ "v2-a-pk-lvl-dry", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-ln-lvl-l1", 0 ],
                    "source": [ "v2-a-pk-lvl-l1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-ln-lvl-l2", 0 ],
                    "source": [ "v2-a-pk-lvl-l2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-ln-lvl-l3", 0 ],
                    "source": [ "v2-a-pk-lvl-l3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-ln-pitch", 0 ],
                    "source": [ "v2-a-pk-pitch", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-ln-rate", 0 ],
                    "source": [ "v2-a-pk-rate", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-ln-time", 0 ],
                    "source": [ "v2-a-pk-time", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-ln-verb", 0 ],
                    "source": [ "v2-a-pk-verb", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-rare-metro", 1 ],
                    "source": [ "v2-a-rare-int", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-rare-t", 0 ],
                    "source": [ "v2-a-rare-metro", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-rare-int", 0 ],
                    "source": [ "v2-a-rare-rnd", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-mrnd", 0 ],
                    "source": [ "v2-a-rare-t", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-rare-rnd", 0 ],
                    "source": [ "v2-a-rare-t", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-rect", 0 ],
                    "source": [ "v2-a-recsel", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-seed", 0 ],
                    "source": [ "v2-a-rect", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-rs0", 0 ],
                    "order": 8,
                    "source": [ "v2-a-rect", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-rs1", 0 ],
                    "order": 7,
                    "source": [ "v2-a-rect", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-rs2", 0 ],
                    "order": 6,
                    "source": [ "v2-a-rect", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-rs3", 0 ],
                    "order": 5,
                    "source": [ "v2-a-rect", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-rs4", 0 ],
                    "order": 4,
                    "source": [ "v2-a-rect", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-rs5", 0 ],
                    "order": 3,
                    "source": [ "v2-a-rect", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-rs6", 0 ],
                    "order": 2,
                    "source": [ "v2-a-rect", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-rs7", 0 ],
                    "order": 1,
                    "source": [ "v2-a-rect", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-rs8", 0 ],
                    "order": 0,
                    "source": [ "v2-a-rect", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-dr-lvl-dry", 0 ],
                    "source": [ "v2-a-rs0", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-dr-lvl-l1", 0 ],
                    "source": [ "v2-a-rs1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-dr-lvl-l2", 0 ],
                    "source": [ "v2-a-rs2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-dr-lvl-l3", 0 ],
                    "source": [ "v2-a-rs3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-dr-rate", 0 ],
                    "source": [ "v2-a-rs4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-dr-pitch", 0 ],
                    "source": [ "v2-a-rs5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-dr-fb", 0 ],
                    "source": [ "v2-a-rs6", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-dr-time", 0 ],
                    "source": [ "v2-a-rs7", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-dr-verb", 0 ],
                    "source": [ "v2-a-rs8", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-sm0", 0 ],
                    "source": [ "v2-a-seedgate", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-sm1", 0 ],
                    "source": [ "v2-a-seedgate", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-sm10", 0 ],
                    "source": [ "v2-a-seedgate", 10 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-sm11", 0 ],
                    "source": [ "v2-a-seedgate", 11 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-sm12", 0 ],
                    "source": [ "v2-a-seedgate", 12 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-sm2", 0 ],
                    "source": [ "v2-a-seedgate", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-sm3", 0 ],
                    "source": [ "v2-a-seedgate", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-sm4", 0 ],
                    "source": [ "v2-a-seedgate", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-sm5", 0 ],
                    "source": [ "v2-a-seedgate", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-sm6", 0 ],
                    "source": [ "v2-a-seedgate", 6 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-sm7", 0 ],
                    "source": [ "v2-a-seedgate", 7 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-sm8", 0 ],
                    "source": [ "v2-a-seedgate", 8 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-sm9", 0 ],
                    "source": [ "v2-a-seedgate", 9 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-seednz", 0 ],
                    "source": [ "v2-a-seedgen", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-seedgate", 1 ],
                    "source": [ "v2-a-seednz", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-seedgen", 0 ],
                    "source": [ "v2-a-seedset", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-seedset", 0 ],
                    "source": [ "v2-a-seedt", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-uzi", 0 ],
                    "source": [ "v2-a-seedt", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-slow-metro", 1 ],
                    "source": [ "v2-a-slow-int", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-slow-t", 0 ],
                    "source": [ "v2-a-slow-metro", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-slow-int", 0 ],
                    "source": [ "v2-a-slow-rnd", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-dr-verb", 0 ],
                    "order": 4,
                    "source": [ "v2-a-slow-t", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-g-lvl-dry", 1 ],
                    "order": 3,
                    "source": [ "v2-a-slow-t", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-g-lvl-l1", 1 ],
                    "order": 2,
                    "source": [ "v2-a-slow-t", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-g-lvl-l2", 1 ],
                    "order": 1,
                    "source": [ "v2-a-slow-t", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-g-lvl-l3", 1 ],
                    "order": 0,
                    "source": [ "v2-a-slow-t", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-slow-rnd", 0 ],
                    "source": [ "v2-a-slow-t", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-slow-rnd", 0 ],
                    "source": [ "v2-a-sm0", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-mid-rnd", 0 ],
                    "source": [ "v2-a-sm1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-dr-time", 0 ],
                    "source": [ "v2-a-sm10", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-dr-verb", 0 ],
                    "source": [ "v2-a-sm11", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-mrnd", 0 ],
                    "source": [ "v2-a-sm12", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-rare-rnd", 0 ],
                    "source": [ "v2-a-sm2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-dr-lvl-dry", 0 ],
                    "source": [ "v2-a-sm3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-dr-lvl-l1", 0 ],
                    "source": [ "v2-a-sm4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-dr-lvl-l2", 0 ],
                    "source": [ "v2-a-sm5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-dr-lvl-l3", 0 ],
                    "source": [ "v2-a-sm6", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-dr-rate", 0 ],
                    "source": [ "v2-a-sm7", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-dr-pitch", 0 ],
                    "source": [ "v2-a-sm8", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-dr-fb", 0 ],
                    "source": [ "v2-a-sm9", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-dr-fb", 2 ],
                    "order": 2,
                    "source": [ "v2-a-stepsc", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-dr-lvl-dry", 2 ],
                    "order": 8,
                    "source": [ "v2-a-stepsc", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-dr-lvl-l1", 2 ],
                    "order": 7,
                    "source": [ "v2-a-stepsc", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-dr-lvl-l2", 2 ],
                    "order": 6,
                    "source": [ "v2-a-stepsc", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-dr-lvl-l3", 2 ],
                    "order": 5,
                    "source": [ "v2-a-stepsc", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-dr-pitch", 2 ],
                    "order": 3,
                    "source": [ "v2-a-stepsc", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-dr-rate", 2 ],
                    "order": 4,
                    "source": [ "v2-a-stepsc", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-dr-time", 2 ],
                    "order": 1,
                    "source": [ "v2-a-stepsc", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-dr-verb", 2 ],
                    "order": 0,
                    "source": [ "v2-a-stepsc", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-sumx", 0 ],
                    "source": [ "v2-a-sum", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-zero", 0 ],
                    "source": [ "v2-a-sumx", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-seedgate", 0 ],
                    "source": [ "v2-a-uzi", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-seedgen", 0 ],
                    "source": [ "v2-a-uzi", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-a-dryon", 0 ],
                    "source": [ "v2-a-zero", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-ccgate", 0 ],
                    "source": [ "v2-ccclose", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-l1-lvl", 0 ],
                    "source": [ "v2-ccgate", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-l1-pitch", 0 ],
                    "source": [ "v2-ccgate", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-l1-rate", 0 ],
                    "source": [ "v2-ccgate", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-l2-fb", 0 ],
                    "source": [ "v2-ccgate", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-l2-lvl", 0 ],
                    "source": [ "v2-ccgate", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-l2-time", 0 ],
                    "source": [ "v2-ccgate", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-mout", 0 ],
                    "source": [ "v2-ccgate", 7 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-verb", 0 ],
                    "source": [ "v2-ccgate", 6 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-ccgate", 0 ],
                    "source": [ "v2-ccinc", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-midi-last", 0 ],
                    "source": [ "v2-ccshow", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-ccclose", 0 ],
                    "source": [ "v2-ccsplit", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-ccinc", 0 ],
                    "source": [ "v2-ccsplit", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-ccsplit", 0 ],
                    "source": [ "v2-ccsub", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-ccgate", 1 ],
                    "source": [ "v2-ctlin", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-ccshow", 0 ],
                    "order": 1,
                    "source": [ "v2-ctlin", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-ccsub", 0 ],
                    "order": 0,
                    "source": [ "v2-ctlin", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-dry-pl", 0 ],
                    "order": 1,
                    "source": [ "v2-dry-g", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-dry-pr", 0 ],
                    "order": 0,
                    "source": [ "v2-dry-g", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-dry-g", 1 ],
                    "source": [ "v2-dry-line", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-dry-ramp", 0 ],
                    "source": [ "v2-dry-mul", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-dry-mul", 0 ],
                    "source": [ "v2-dry-pak", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-mixL", 0 ],
                    "source": [ "v2-dry-pl", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-mixR", 0 ],
                    "source": [ "v2-dry-pr", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-dry-line", 0 ],
                    "source": [ "v2-dry-ramp", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-dry-pak", 0 ],
                    "source": [ "v2-dry-scale", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-dry-lvl", 0 ],
                    "source": [ "v2-init-0", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-l1-lvl", 0 ],
                    "source": [ "v2-init-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-dry-mute", 0 ],
                    "source": [ "v2-init-10", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-l3-src", 0 ],
                    "source": [ "v2-init-11", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-a-act", 0 ],
                    "source": [ "v2-init-12", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-opt-dry", 0 ],
                    "source": [ "v2-init-13", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-opt-l1", 0 ],
                    "source": [ "v2-init-14", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-opt-l2", 0 ],
                    "source": [ "v2-init-15", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-opt-l3", 0 ],
                    "source": [ "v2-init-16", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-l2-lvl", 0 ],
                    "source": [ "v2-init-2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-l3-lvl", 0 ],
                    "source": [ "v2-init-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-l1-rate", 0 ],
                    "source": [ "v2-init-4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-l1-pitch", 0 ],
                    "source": [ "v2-init-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-l2-fb", 0 ],
                    "source": [ "v2-init-6", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-l2-time", 0 ],
                    "source": [ "v2-init-7", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-verb", 0 ],
                    "source": [ "v2-init-8", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-mout", 0 ],
                    "source": [ "v2-init-9", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-init-0", 0 ],
                    "order": 16,
                    "source": [ "v2-init-del", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-init-1", 0 ],
                    "order": 15,
                    "source": [ "v2-init-del", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-init-10", 0 ],
                    "order": 6,
                    "source": [ "v2-init-del", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-init-11", 0 ],
                    "order": 5,
                    "source": [ "v2-init-del", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-init-12", 0 ],
                    "order": 4,
                    "source": [ "v2-init-del", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-init-13", 0 ],
                    "order": 3,
                    "source": [ "v2-init-del", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-init-14", 0 ],
                    "order": 2,
                    "source": [ "v2-init-del", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-init-15", 0 ],
                    "order": 1,
                    "source": [ "v2-init-del", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-init-16", 0 ],
                    "order": 0,
                    "source": [ "v2-init-del", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-init-2", 0 ],
                    "order": 14,
                    "source": [ "v2-init-del", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-init-3", 0 ],
                    "order": 13,
                    "source": [ "v2-init-del", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-init-4", 0 ],
                    "order": 12,
                    "source": [ "v2-init-del", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-init-5", 0 ],
                    "order": 11,
                    "source": [ "v2-init-del", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-init-6", 0 ],
                    "order": 10,
                    "source": [ "v2-init-del", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-init-7", 0 ],
                    "order": 9,
                    "source": [ "v2-init-del", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-init-8", 0 ],
                    "order": 8,
                    "source": [ "v2-init-del", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-init-9", 0 ],
                    "order": 7,
                    "source": [ "v2-init-del", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-init-del", 0 ],
                    "order": 1,
                    "source": [ "v2-init-lb", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-init-seeddel", 0 ],
                    "order": 0,
                    "source": [ "v2-init-lb", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-seed", 0 ],
                    "source": [ "v2-init-seed", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-init-seed", 0 ],
                    "source": [ "v2-init-seeddel", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-knobmsg", 0 ],
                    "source": [ "v2-knoblb", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-knobbase", 0 ],
                    "source": [ "v2-knobmsg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l1-winm", 0 ],
                    "source": [ "v2-l1-cos", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l1-pl", 0 ],
                    "order": 1,
                    "source": [ "v2-l1-g", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l1-pr", 0 ],
                    "order": 0,
                    "source": [ "v2-l1-g", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l1-g", 0 ],
                    "source": [ "v2-l1-gwin", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l1-sah", 1 ],
                    "source": [ "v2-l1-inva", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l1-inva", 0 ],
                    "source": [ "v2-l1-invm", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l1-g", 1 ],
                    "source": [ "v2-l1-line", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l1-ramp", 0 ],
                    "source": [ "v2-l1-mul", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l1-sah", 0 ],
                    "source": [ "v2-l1-noise", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l1-mul", 0 ],
                    "source": [ "v2-l1-pak", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l1-cos", 0 ],
                    "order": 0,
                    "source": [ "v2-l1-ph", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l1-invm", 0 ],
                    "order": 2,
                    "source": [ "v2-l1-ph", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l1-span", 0 ],
                    "order": 1,
                    "source": [ "v2-l1-ph", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l1-spanpak", 1 ],
                    "source": [ "v2-l1-pitchsc", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-mixL", 0 ],
                    "source": [ "v2-l1-pl", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l1-read", 0 ],
                    "source": [ "v2-l1-posa", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l1-posa", 0 ],
                    "source": [ "v2-l1-posm", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-mixR", 0 ],
                    "source": [ "v2-l1-pr", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l1-line", 0 ],
                    "source": [ "v2-l1-ramp", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l1-ph", 0 ],
                    "order": 1,
                    "source": [ "v2-l1-ratesc", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l1-spanpak", 0 ],
                    "order": 0,
                    "source": [ "v2-l1-ratesc", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l1-wave", 0 ],
                    "source": [ "v2-l1-read", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l1-recmsg", 0 ],
                    "source": [ "v2-l1-reclb", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l1-rec", 0 ],
                    "source": [ "v2-l1-recmsg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l1-sel", 2 ],
                    "source": [ "v2-l1-rexc", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l1-sel", 1 ],
                    "source": [ "v2-l1-rsom", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l1-posm", 0 ],
                    "source": [ "v2-l1-sah", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l1-pak", 0 ],
                    "source": [ "v2-l1-scale", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l1-rec", 0 ],
                    "source": [ "v2-l1-sel", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l1-read", 1 ],
                    "source": [ "v2-l1-span", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l1-span", 1 ],
                    "source": [ "v2-l1-spanexp", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l1-spanexp", 0 ],
                    "source": [ "v2-l1-spanpak", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l1-sel", 0 ],
                    "source": [ "v2-l1-srcinc", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l1-srcmsg", 0 ],
                    "source": [ "v2-l1-srclb", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l1-sel", 0 ],
                    "source": [ "v2-l1-srcmsg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l1-gwin", 0 ],
                    "source": [ "v2-l1-wave", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l1-gwin", 1 ],
                    "source": [ "v2-l1-wina", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l1-wina", 0 ],
                    "source": [ "v2-l1-winm", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l2-tapin", 0 ],
                    "source": [ "v2-l2-fbmul", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l2-fbmul", 1 ],
                    "source": [ "v2-l2-fbsc", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l2-pl", 0 ],
                    "order": 1,
                    "source": [ "v2-l2-g", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l2-pr", 0 ],
                    "order": 0,
                    "source": [ "v2-l2-g", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l2-lfod", 0 ],
                    "source": [ "v2-l2-lfo", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l2-tadd", 0 ],
                    "source": [ "v2-l2-lfod", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l2-g", 1 ],
                    "source": [ "v2-l2-line", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l2-fbmul", 0 ],
                    "source": [ "v2-l2-lp", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l2-ramp", 0 ],
                    "source": [ "v2-l2-mul", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l2-mul", 0 ],
                    "source": [ "v2-l2-pak", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-mixL", 0 ],
                    "source": [ "v2-l2-pl", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-mixR", 0 ],
                    "source": [ "v2-l2-pr", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l2-line", 0 ],
                    "source": [ "v2-l2-ramp", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l2-sel", 2 ],
                    "source": [ "v2-l2-rexc", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l2-sel", 1 ],
                    "source": [ "v2-l2-rsom", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l2-pak", 0 ],
                    "source": [ "v2-l2-scale", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l2-tapin", 0 ],
                    "source": [ "v2-l2-sel", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l2-sel", 0 ],
                    "source": [ "v2-l2-srcinc", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l2-srcmsg", 0 ],
                    "source": [ "v2-l2-srclb", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l2-sel", 0 ],
                    "source": [ "v2-l2-srcmsg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l2-tapout", 0 ],
                    "source": [ "v2-l2-tadd", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l2-tapout", 0 ],
                    "source": [ "v2-l2-tapin", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l2-g", 0 ],
                    "order": 1,
                    "source": [ "v2-l2-tapout", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l2-lp", 0 ],
                    "order": 0,
                    "source": [ "v2-l2-tapout", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l2-tadd", 1 ],
                    "source": [ "v2-l2-timesc", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l3-nn", 0 ],
                    "source": [ "v2-l3-en", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l3-enmsg", 0 ],
                    "source": [ "v2-l3-enlb", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l3-nn", 0 ],
                    "source": [ "v2-l3-enmsg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l3-pl", 0 ],
                    "order": 1,
                    "source": [ "v2-l3-g", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l3-pr", 0 ],
                    "order": 0,
                    "source": [ "v2-l3-g", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l3-g", 1 ],
                    "source": [ "v2-l3-line", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l3-ramp", 0 ],
                    "source": [ "v2-l3-mul", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l3-g", 0 ],
                    "source": [ "v2-l3-nn", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l3-mul", 0 ],
                    "source": [ "v2-l3-pak", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-mixL", 0 ],
                    "source": [ "v2-l3-pl", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-mixR", 0 ],
                    "source": [ "v2-l3-pr", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l3-line", 0 ],
                    "source": [ "v2-l3-ramp", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l3-sel", 2 ],
                    "source": [ "v2-l3-rexc", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l3-sel", 1 ],
                    "source": [ "v2-l3-rsom", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l3-pak", 0 ],
                    "source": [ "v2-l3-scale", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l3-nn", 0 ],
                    "source": [ "v2-l3-sel", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l3-sel", 0 ],
                    "source": [ "v2-l3-srcinc", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l3-srcmsg", 0 ],
                    "source": [ "v2-l3-srclb", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-l3-sel", 0 ],
                    "source": [ "v2-l3-srcmsg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "audio-dsp", 1 ],
                    "order": 1,
                    "source": [ "v2-lim", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "audio-dsp", 0 ],
                    "order": 2,
                    "source": [ "v2-lim", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rec-sfrecord", 1 ],
                    "order": 0,
                    "source": [ "v2-lim", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rec-sfrecord", 0 ],
                    "order": 1,
                    "source": [ "v2-lim", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-meter", 0 ],
                    "order": 0,
                    "source": [ "v2-lim", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-outL", 0 ],
                    "order": 0,
                    "source": [ "v2-mixL", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-verb-send", 0 ],
                    "order": 1,
                    "source": [ "v2-mixL", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-outR", 0 ],
                    "order": 0,
                    "source": [ "v2-mixR", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-verb-send", 0 ],
                    "order": 1,
                    "source": [ "v2-mixR", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-outL", 1 ],
                    "order": 1,
                    "source": [ "v2-moutline", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-outR", 1 ],
                    "order": 0,
                    "source": [ "v2-moutline", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-moutline", 0 ],
                    "source": [ "v2-moutramp", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-moutramp", 0 ],
                    "source": [ "v2-moutsc", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-strip", 1 ],
                    "source": [ "v2-notein", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-strip", 0 ],
                    "source": [ "v2-notein", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-lim", 0 ],
                    "source": [ "v2-outL", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-lim", 1 ],
                    "source": [ "v2-outR", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-padmsg", 0 ],
                    "source": [ "v2-padlb", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-padbase", 0 ],
                    "source": [ "v2-padmsg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-dry-mute", 0 ],
                    "source": [ "v2-padsel", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-l1-mute", 0 ],
                    "source": [ "v2-padsel", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-l2-mute", 0 ],
                    "source": [ "v2-padsel", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-l3-mute", 0 ],
                    "source": [ "v2-padsel", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-midi-last", 0 ],
                    "source": [ "v2-padshow", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-padsel", 0 ],
                    "source": [ "v2-padsub", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-padshow", 0 ],
                    "order": 1,
                    "source": [ "v2-strip", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-padsub", 0 ],
                    "order": 0,
                    "source": [ "v2-strip", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-verb-a2", 0 ],
                    "source": [ "v2-verb-a1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-outL", 0 ],
                    "source": [ "v2-verb-a2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-verb-a4", 0 ],
                    "source": [ "v2-verb-a3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-outR", 0 ],
                    "source": [ "v2-verb-a4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-verb-damp", 0 ],
                    "source": [ "v2-verb-c0", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-verb-damp", 0 ],
                    "source": [ "v2-verb-c1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-verb-damp", 0 ],
                    "source": [ "v2-verb-c2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-verb-damp", 0 ],
                    "source": [ "v2-verb-c3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-verb-a1", 0 ],
                    "order": 1,
                    "source": [ "v2-verb-damp", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-verb-a3", 0 ],
                    "order": 0,
                    "source": [ "v2-verb-damp", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-verb-c0", 0 ],
                    "order": 3,
                    "source": [ "v2-verb-send", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-verb-c1", 0 ],
                    "order": 2,
                    "source": [ "v2-verb-send", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-verb-c2", 0 ],
                    "order": 1,
                    "source": [ "v2-verb-send", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-verb-c3", 0 ],
                    "order": 0,
                    "source": [ "v2-verb-send", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-verb-send", 1 ],
                    "source": [ "v2-verbline", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-verbline", 0 ],
                    "source": [ "v2-verbramp", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v2-verbramp", 0 ],
                    "source": [ "v2-verbsc", 0 ]
                }
            }
        ],
        "parameters": {
            "audio-corpus-builder::obj-395::obj-2": [ "live.text[36]", "live.text[4]", 0 ],
            "audio-corpus-builder::obj-395::obj-375": [ "mc.live.gain~[8]", "click", 0 ],
            "audio-corpus-builder::obj-395::obj-441": [ "mc.live.gain~[7]", "corpus", 0 ],
            "audio-corpus-builder::obj-395::obj-469": [ "live.text[37]", "live.text[11]", 0 ],
            "audio-corpus-builder::obj-395::obj-472": [ "live.text[35]", "live.text[11]", 0 ],
            "audio-corpus-builder::obj-395::obj-490": [ "live.text[38]", "live.text[11]", 0 ],
            "audio-influencer-app::obj-121": [ "Gain[4]", "Gain", 0 ],
            "audio-influencer-app::obj-46": [ "live.dial[2]", "Pan", 0 ],
            "audio-influencer-app::obj-95": [ "Delay", "Delay", 0 ],
            "input-gain": [ "live.gain~[2]", "live.gain~[2]", 0 ],
            "player-app::obj-118::obj-114": [ "live.gain~[1]", "live.gain~", 0 ],
            "player-app::obj-118::obj-119": [ "live.text[67]", "live.text[30]", 0 ],
            "player-app::obj-118::obj-2::obj-119": [ "live.text[66]", "live.text[30]", 0 ],
            "player-app::obj-118::obj-2::obj-13": [ "live.text[34]", "live.text", 0 ],
            "player-app::obj-118::obj-2::obj-140": [ "mc.live.gain~[9]", "mc.live.gain~", 0 ],
            "player-app::obj-118::obj-2::obj-62::obj-1": [ "source[7]", "source", 0 ],
            "player-app::obj-118::obj-42": [ "live.toggle", "live.toggle", 0 ],
            "player-app::obj-118::obj-55": [ "live.gain~", "live.gain~", 0 ],
            "player-app::obj-17::obj-103": [ "influence delay[4]", "influencedelay", 0 ],
            "player-app::obj-17::obj-10::obj-103": [ "influence delay[2]", "influencedelay", 0 ],
            "player-app::obj-17::obj-10::obj-21": [ "onset[4]", "onset", 0 ],
            "player-app::obj-17::obj-10::obj-26": [ "chroma scaling factor[6]", "chroma", 0 ],
            "player-app::obj-17::obj-10::obj-28": [ "chromaonset[4]", "chromaonset", 0 ],
            "player-app::obj-17::obj-10::obj-29": [ "enable[4]", "enable", 0 ],
            "player-app::obj-17::obj-10::obj-30": [ "chroma scaling factor[5]", "chroma", 0 ],
            "player-app::obj-17::obj-10::obj-46::obj-1": [ "source[2]", "source", 0 ],
            "player-app::obj-17::obj-10::obj-9": [ "pitch[4]", "pitch", 0 ],
            "player-app::obj-17::obj-2::obj-103": [ "influence delay", "influencedelay", 0 ],
            "player-app::obj-17::obj-2::obj-21": [ "onset[2]", "onset", 0 ],
            "player-app::obj-17::obj-2::obj-26": [ "chroma scaling factor[10]", "chroma", 0 ],
            "player-app::obj-17::obj-2::obj-28": [ "chromaonset[2]", "chromaonset", 0 ],
            "player-app::obj-17::obj-2::obj-29": [ "enable[2]", "enable", 0 ],
            "player-app::obj-17::obj-2::obj-30": [ "chroma scaling factor[2]", "chroma", 0 ],
            "player-app::obj-17::obj-2::obj-46::obj-1": [ "source[5]", "source", 0 ],
            "player-app::obj-17::obj-2::obj-9": [ "pitch[2]", "pitch", 0 ],
            "player-app::obj-17::obj-33::obj-103": [ "influence delay[3]", "influencedelay", 0 ],
            "player-app::obj-17::obj-33::obj-21": [ "onset[5]", "onset", 0 ],
            "player-app::obj-17::obj-33::obj-26": [ "chroma scaling factor[7]", "chroma", 0 ],
            "player-app::obj-17::obj-33::obj-28": [ "chromaonset[5]", "chromaonset", 0 ],
            "player-app::obj-17::obj-33::obj-29": [ "enable[5]", "enable", 0 ],
            "player-app::obj-17::obj-33::obj-30": [ "chroma scaling factor[8]", "chroma", 0 ],
            "player-app::obj-17::obj-33::obj-46::obj-1": [ "source[6]", "source", 0 ],
            "player-app::obj-17::obj-33::obj-9": [ "pitch[5]", "pitch", 0 ],
            "player-app::obj-17::obj-6::obj-103": [ "influence delay[1]", "influencedelay", 0 ],
            "player-app::obj-17::obj-6::obj-21": [ "onset[3]", "onset", 0 ],
            "player-app::obj-17::obj-6::obj-26": [ "chroma scaling factor[4]", "chroma", 0 ],
            "player-app::obj-17::obj-6::obj-28": [ "chromaonset[3]", "chromaonset", 0 ],
            "player-app::obj-17::obj-6::obj-29": [ "enable[3]", "enable", 0 ],
            "player-app::obj-17::obj-6::obj-30": [ "chroma scaling factor[3]", "chroma", 0 ],
            "player-app::obj-17::obj-6::obj-46::obj-1": [ "source[1]", "source", 0 ],
            "player-app::obj-17::obj-6::obj-9": [ "pitch[3]", "pitch", 0 ],
            "player-app::obj-25::obj-1": [ "Gain", "Gain", 0 ],
            "player-app::obj-25::obj-44": [ "live.dial[1]", "Width", 0 ],
            "player-app::obj-25::obj-46": [ "live.dial", "Pan", 0 ],
            "player-app::obj-3::obj-1115": [ "continuity[22]", "continuity", 0 ],
            "player-app::obj-3::obj-1150": [ "live.text[65]", "live.text", 0 ],
            "player-app::obj-3::obj-1179": [ "continuity[23]", "continuity", 0 ],
            "player-app::obj-3::obj-123::obj-1": [ "live.text[10]", "live.text", 0 ],
            "player-app::obj-3::obj-123::obj-2": [ "live.text[12]", "live.text", 0 ],
            "player-app::obj-3::obj-123::obj-3": [ "live.text[11]", "live.text", 0 ],
            "player-app::obj-3::obj-14::obj-12": [ "live.slider[2]", "live.slider[2]", 0 ],
            "player-app::obj-3::obj-14::obj-128": [ "live.text[62]", "live.text", 1 ],
            "player-app::obj-3::obj-14::obj-135": [ "live.text[59]", "live.text", 1 ],
            "player-app::obj-3::obj-14::obj-153": [ "live.text[61]", "live.text", 1 ],
            "player-app::obj-3::obj-14::obj-163": [ "live.text[60]", "live.text", 1 ],
            "player-app::obj-3::obj-14::obj-173": [ "live.text[51]", "live.text", 1 ],
            "player-app::obj-3::obj-14::obj-39": [ "live.tab[1]", "live.tab", 0 ],
            "player-app::obj-3::obj-14::obj-40": [ "live.slider[4]", "live.slider[2]", 0 ],
            "player-app::obj-3::obj-14::obj-64": [ "live.text[52]", "live.text", 0 ],
            "player-app::obj-3::obj-16::obj-26": [ "corpusname[4]", "corpusname", 0 ],
            "player-app::obj-3::obj-2": [ "heldnotesmode[6]", "heldnotesmode", 0 ],
            "player-app::obj-3::obj-32": [ "heldnotesmode[3]", "heldnotesmode", 0 ],
            "player-app::obj-3::obj-407::obj-1001::obj-89::obj-1": [ "live.text[21]", "live.text", 0 ],
            "player-app::obj-3::obj-407::obj-1001::obj-89::obj-2": [ "live.text[19]", "live.text", 0 ],
            "player-app::obj-3::obj-407::obj-1001::obj-89::obj-3": [ "live.text[20]", "live.text", 0 ],
            "player-app::obj-3::obj-407::obj-1039::obj-89::obj-1": [ "live.text[22]", "live.text", 0 ],
            "player-app::obj-3::obj-407::obj-1039::obj-89::obj-2": [ "live.text[24]", "live.text", 0 ],
            "player-app::obj-3::obj-407::obj-1039::obj-89::obj-3": [ "live.text[23]", "live.text", 0 ],
            "player-app::obj-3::obj-407::obj-1105": [ "harmonincpeakdecay[8]", "harmonincpeakdecay", 0 ],
            "player-app::obj-3::obj-407::obj-1115": [ "continuity[1]", "continuity", 0 ],
            "player-app::obj-3::obj-407::obj-1175": [ "heldnotesmode[2]", "heldnotesmode", 0 ],
            "player-app::obj-3::obj-407::obj-1179": [ "continuity[16]", "continuity", 0 ],
            "player-app::obj-3::obj-407::obj-12": [ "melodicmod12[1]", "melodicmod12", 0 ],
            "player-app::obj-3::obj-407::obj-120": [ "melodicbypass[1]", "melodicbypass", 0 ],
            "player-app::obj-3::obj-407::obj-1218": [ "simultaneousonsets[2]", "artificialmidities", 0 ],
            "player-app::obj-3::obj-407::obj-126": [ "harmonicbypass[1]", "harmonicbypass", 0 ],
            "player-app::obj-3::obj-407::obj-134": [ "continuity[17]", "continuity", 0 ],
            "player-app::obj-3::obj-407::obj-1344": [ "enforcetaboo[4]", "enforcetaboo", 0 ],
            "player-app::obj-3::obj-407::obj-140": [ "resetinfluences[1]", "resetinfluences", 0 ],
            "player-app::obj-3::obj-407::obj-144": [ "harmonicngramorder[1]", "harmonicngramorder", 0 ],
            "player-app::obj-3::obj-407::obj-1444": [ "outputprobability[4]", "outputprobability", 0 ],
            "player-app::obj-3::obj-407::obj-152": [ "selfngramorder[1]", "selfngramorder", 0 ],
            "player-app::obj-3::obj-407::obj-154": [ "melodicngramorder[4]", "melodicngramorder", 0 ],
            "player-app::obj-3::obj-407::obj-19": [ "selfmod12[4]", "selfmod12", 0 ],
            "player-app::obj-3::obj-407::obj-22": [ "selfmelodicbypass[1]", "selfmelodicbypass", 0 ],
            "player-app::obj-3::obj-407::obj-254": [ "harmonincpeakdecay[2]", "harmonincpeakdecay", 0 ],
            "player-app::obj-3::obj-407::obj-255": [ "melodicpeakdecay[4]", "melodicpeakdecay", 0 ],
            "player-app::obj-3::obj-407::obj-256": [ "selfpeakdecay[1]", "selfpeakdecay", 0 ],
            "player-app::obj-3::obj-407::obj-270::obj-1226": [ "width[1]", "Width", 0 ],
            "player-app::obj-3::obj-407::obj-270::obj-1227": [ "center[1]", "Center", 0 ],
            "player-app::obj-3::obj-407::obj-270::obj-1240": [ "live.slider[3]", "live.slider", 0 ],
            "player-app::obj-3::obj-407::obj-270::obj-1241": [ "live.numbox[3]", "live.numbox[2]", 0 ],
            "player-app::obj-3::obj-407::obj-270::obj-622": [ "__exp_velocityenable[1]", "__exp_velocityenable", 0 ],
            "player-app::obj-3::obj-407::obj-270::obj-889": [ "weight[1]", "Weight", 0 ],
            "player-app::obj-3::obj-407::obj-295": [ "playingmode[4]", "playingmode", 0 ],
            "player-app::obj-3::obj-407::obj-298": [ "simultaneousonsets[7]", "simultaneousonsets", 0 ],
            "player-app::obj-3::obj-407::obj-328": [ "decaybasis[1]", "decaybasis", 0 ],
            "player-app::obj-3::obj-407::obj-387::obj-89::obj-1": [ "live.text[28]", "live.text", 0 ],
            "player-app::obj-3::obj-407::obj-387::obj-89::obj-2": [ "live.text[30]", "live.text", 0 ],
            "player-app::obj-3::obj-407::obj-387::obj-89::obj-3": [ "live.text[29]", "live.text", 0 ],
            "player-app::obj-3::obj-407::obj-497::obj-89::obj-1": [ "live.text[25]", "live.text", 0 ],
            "player-app::obj-3::obj-407::obj-497::obj-89::obj-2": [ "live.text[27]", "live.text", 0 ],
            "player-app::obj-3::obj-407::obj-497::obj-89::obj-3": [ "live.text[26]", "live.text", 0 ],
            "player-app::obj-3::obj-407::obj-570": [ "__exp_melodicpitchfromchords[4]", "__exp_melodicpitchfromchords", 0 ],
            "player-app::obj-3::obj-407::obj-575": [ "__exp_tempoconsistencysigma[4]", "__exp_tempoconsistencysigma", 0 ],
            "player-app::obj-3::obj-407::obj-642": [ "__exp_numnotessigma[1]", "__exp_numnotessigma", 0 ],
            "player-app::obj-3::obj-407::obj-653": [ "__exp_numnotesenable[4]", "__exp_numnotesenable", 0 ],
            "player-app::obj-3::obj-407::obj-656": [ "__exp_numnotesmu[1]", "__exp_numnotesmu", 0 ],
            "player-app::obj-3::obj-407::obj-667": [ "selfharmonicbypass[1]", "selfharmonicbypass", 0 ],
            "player-app::obj-3::obj-407::obj-670": [ "harmonicbypass[2]", "harmonicbypass", 0 ],
            "player-app::obj-3::obj-407::obj-679": [ "selfharmonicngramorder[1]", "selfharmonicngramorder", 0 ],
            "player-app::obj-3::obj-407::obj-685": [ "harmonincpeakdecay[5]", "harmonincpeakdecay[1]", 0 ],
            "player-app::obj-3::obj-407::obj-688": [ "__exp_durationsigma[4]", "__exp_durationsigma", 0 ],
            "player-app::obj-3::obj-407::obj-702": [ "__exp_durationmu[1]", "__exp_durationmu", 0 ],
            "player-app::obj-3::obj-407::obj-722": [ "__exp_octavebandsenable[4]", "__exp_octavebandsenable", 0 ],
            "player-app::obj-3::obj-407::obj-733": [ "__exp_octavebands[1]", "__exp_octavebands", 0 ],
            "player-app::obj-3::obj-407::obj-746": [ "__exp_selfpitchfromchords[4]", "__exp_selfpitchfromchords", 0 ],
            "player-app::obj-3::obj-407::obj-763": [ "__exp_autojumpforcejump[1]", "__exp_autojumpforcejump", 0 ],
            "player-app::obj-3::obj-407::obj-774": [ "__exp_autojumpenable[1]", "__exp_autojumpenable", 0 ],
            "player-app::obj-3::obj-407::obj-777": [ "__exp_autojumpactivate[1]", "__exp_autojumpactivate", 0 ],
            "player-app::obj-3::obj-407::obj-799": [ "__exp_tempoconsistencyenable[4]", "__exp_tempoconsistencyenable", 0 ],
            "player-app::obj-3::obj-407::obj-802": [ "__exp_tempoconsistencylen[4]", "__exp_tempoconsistencylen", 0 ],
            "player-app::obj-3::obj-407::obj-814": [ "harmonincpeakdecay[6]", "harmonincpeakdecay", 0 ],
            "player-app::obj-3::obj-407::obj-842::obj-89::obj-1": [ "live.text[18]", "live.text", 0 ],
            "player-app::obj-3::obj-407::obj-842::obj-89::obj-2": [ "live.text[17]", "live.text", 0 ],
            "player-app::obj-3::obj-407::obj-842::obj-89::obj-3": [ "live.text[16]", "live.text", 0 ],
            "player-app::obj-3::obj-407::obj-843": [ "harmonicngramorder[2]", "harmonicngramorder", 0 ],
            "player-app::obj-3::obj-407::obj-860": [ "harmonincpeakdecay[3]", "harmonincpeakdecay[1]", 0 ],
            "player-app::obj-3::obj-407::obj-865": [ "selfharmonicngramorder[4]", "selfharmonicngramorder", 0 ],
            "player-app::obj-3::obj-407::obj-870": [ "selfharmonicbypass[4]", "selfharmonicbypass", 0 ],
            "player-app::obj-3::obj-407::obj-871": [ "harmonincpeakdecay[7]", "harmonincpeakdecay", 0 ],
            "player-app::obj-3::obj-407::obj-96::obj-89::obj-1": [ "live.text[14]", "live.text", 0 ],
            "player-app::obj-3::obj-407::obj-96::obj-89::obj-2": [ "live.text[13]", "live.text", 0 ],
            "player-app::obj-3::obj-407::obj-96::obj-89::obj-3": [ "live.text[15]", "live.text", 0 ],
            "player-app::obj-3::obj-79::obj-1": [ "live.text[121]", "live.text", 0 ],
            "player-app::obj-3::obj-79::obj-2": [ "live.text[120]", "live.text", 0 ],
            "player-app::obj-3::obj-79::obj-3": [ "live.text[122]", "live.text", 0 ],
            "player-app::obj-3::obj-85::obj-1": [ "live.text[31]", "live.text", 0 ],
            "player-app::obj-3::obj-85::obj-2": [ "live.text[53]", "live.text", 0 ],
            "player-app::obj-3::obj-85::obj-3": [ "live.text[32]", "live.text", 0 ],
            "player-app::obj-3::obj-87::obj-1": [ "live.text[2]", "live.text", 0 ],
            "player-app::obj-3::obj-87::obj-2": [ "live.text[1]", "live.text", 0 ],
            "player-app::obj-3::obj-87::obj-3": [ "live.text[3]", "live.text", 0 ],
            "player-app::obj-3::obj-89::obj-1": [ "live.text[6]", "live.text", 0 ],
            "player-app::obj-3::obj-89::obj-2": [ "live.text[4]", "live.text", 0 ],
            "player-app::obj-3::obj-89::obj-3": [ "live.text[5]", "live.text", 0 ],
            "player-app::obj-3::obj-91::obj-1": [ "live.text[8]", "live.text", 0 ],
            "player-app::obj-3::obj-91::obj-2": [ "live.text[7]", "live.text", 0 ],
            "player-app::obj-3::obj-91::obj-3": [ "live.text[9]", "live.text", 0 ],
            "player-app::obj-3::obj-94::obj-1": [ "live.text[64]", "live.text", 0 ],
            "player-app::obj-3::obj-94::obj-2": [ "live.text[63]", "live.text", 0 ],
            "player-app::obj-3::obj-94::obj-3": [ "live.text[54]", "live.text", 0 ],
            "player-app::obj-6::obj-98": [ "live.text[33]", "live.text[26]", 0 ],
            "server-app::obj-13::obj-1": [ "source[8]", "source", 0 ],
            "server-app::obj-2::obj-395::obj-2": [ "live.text[39]", "live.text[4]", 0 ],
            "server-app::obj-2::obj-395::obj-375": [ "mc.live.gain~[2]", "click", 0 ],
            "server-app::obj-2::obj-395::obj-441": [ "mc.live.gain~[1]", "corpus", 0 ],
            "server-app::obj-2::obj-395::obj-469": [ "live.text[40]", "live.text[11]", 0 ],
            "server-app::obj-2::obj-395::obj-472": [ "live.text[42]", "live.text[11]", 0 ],
            "server-app::obj-2::obj-395::obj-490": [ "live.text[41]", "live.text[11]", 0 ],
            "parameterbanks": {
                "0": {
                    "index": 0,
                    "name": "",
                    "parameters": [ "-", "-", "-", "-", "-", "-", "-", "-" ],
                    "buttons": [ "-", "-", "-", "-", "-", "-", "-", "-" ]
                }
            },
            "parameter_overrides": {
                "audio-corpus-builder::obj-395::obj-2": {
                    "parameter_longname": "live.text[36]"
                },
                "audio-corpus-builder::obj-395::obj-469": {
                    "parameter_longname": "live.text[37]"
                },
                "audio-corpus-builder::obj-395::obj-472": {
                    "parameter_longname": "live.text[35]"
                },
                "audio-corpus-builder::obj-395::obj-490": {
                    "parameter_longname": "live.text[38]"
                },
                "player-app::obj-118::obj-2::obj-13": {
                    "parameter_longname": "live.text[34]"
                },
                "player-app::obj-118::obj-2::obj-62::obj-1": {
                    "parameter_invisible": 0,
                    "parameter_modmode": 0,
                    "parameter_unitstyle": 10
                },
                "player-app::obj-17::obj-10::obj-103": {
                    "parameter_longname": "influence delay[2]"
                },
                "player-app::obj-17::obj-10::obj-26": {
                    "parameter_longname": "chroma scaling factor[6]"
                },
                "player-app::obj-17::obj-10::obj-30": {
                    "parameter_longname": "chroma scaling factor[5]"
                },
                "player-app::obj-17::obj-10::obj-46::obj-1": {
                    "parameter_invisible": 0,
                    "parameter_modmode": 0,
                    "parameter_unitstyle": 10
                },
                "player-app::obj-17::obj-2::obj-46::obj-1": {
                    "parameter_invisible": 0,
                    "parameter_modmode": 0,
                    "parameter_unitstyle": 10
                },
                "player-app::obj-17::obj-33::obj-103": {
                    "parameter_longname": "influence delay[3]"
                },
                "player-app::obj-17::obj-33::obj-26": {
                    "parameter_longname": "chroma scaling factor[7]"
                },
                "player-app::obj-17::obj-33::obj-30": {
                    "parameter_longname": "chroma scaling factor[8]"
                },
                "player-app::obj-17::obj-33::obj-46::obj-1": {
                    "parameter_invisible": 0,
                    "parameter_modmode": 0,
                    "parameter_unitstyle": 10
                },
                "player-app::obj-17::obj-6::obj-103": {
                    "parameter_longname": "influence delay[1]"
                },
                "player-app::obj-17::obj-6::obj-26": {
                    "parameter_longname": "chroma scaling factor[4]"
                },
                "player-app::obj-17::obj-6::obj-30": {
                    "parameter_longname": "chroma scaling factor[3]"
                },
                "player-app::obj-17::obj-6::obj-46::obj-1": {
                    "parameter_invisible": 0,
                    "parameter_modmode": 0,
                    "parameter_unitstyle": 10
                },
                "player-app::obj-3::obj-123::obj-1": {
                    "parameter_longname": "live.text[10]"
                },
                "player-app::obj-3::obj-123::obj-2": {
                    "parameter_longname": "live.text[12]"
                },
                "player-app::obj-3::obj-123::obj-3": {
                    "parameter_longname": "live.text[11]"
                },
                "player-app::obj-3::obj-16::obj-26": {
                    "parameter_invisible": 1,
                    "parameter_modmode": 0,
                    "parameter_unitstyle": 10
                },
                "player-app::obj-3::obj-407::obj-1001::obj-89::obj-1": {
                    "parameter_longname": "live.text[21]"
                },
                "player-app::obj-3::obj-407::obj-1001::obj-89::obj-2": {
                    "parameter_longname": "live.text[19]"
                },
                "player-app::obj-3::obj-407::obj-1001::obj-89::obj-3": {
                    "parameter_longname": "live.text[20]"
                },
                "player-app::obj-3::obj-407::obj-1039::obj-89::obj-1": {
                    "parameter_longname": "live.text[22]"
                },
                "player-app::obj-3::obj-407::obj-1039::obj-89::obj-2": {
                    "parameter_longname": "live.text[24]"
                },
                "player-app::obj-3::obj-407::obj-1039::obj-89::obj-3": {
                    "parameter_longname": "live.text[23]"
                },
                "player-app::obj-3::obj-407::obj-387::obj-89::obj-1": {
                    "parameter_longname": "live.text[28]"
                },
                "player-app::obj-3::obj-407::obj-387::obj-89::obj-2": {
                    "parameter_longname": "live.text[30]"
                },
                "player-app::obj-3::obj-407::obj-387::obj-89::obj-3": {
                    "parameter_longname": "live.text[29]"
                },
                "player-app::obj-3::obj-407::obj-497::obj-89::obj-1": {
                    "parameter_longname": "live.text[25]"
                },
                "player-app::obj-3::obj-407::obj-497::obj-89::obj-2": {
                    "parameter_longname": "live.text[27]"
                },
                "player-app::obj-3::obj-407::obj-497::obj-89::obj-3": {
                    "parameter_longname": "live.text[26]"
                },
                "player-app::obj-3::obj-407::obj-842::obj-89::obj-1": {
                    "parameter_longname": "live.text[18]"
                },
                "player-app::obj-3::obj-407::obj-842::obj-89::obj-2": {
                    "parameter_longname": "live.text[17]"
                },
                "player-app::obj-3::obj-407::obj-842::obj-89::obj-3": {
                    "parameter_longname": "live.text[16]"
                },
                "player-app::obj-3::obj-407::obj-96::obj-89::obj-1": {
                    "parameter_longname": "live.text[14]"
                },
                "player-app::obj-3::obj-407::obj-96::obj-89::obj-2": {
                    "parameter_longname": "live.text[13]"
                },
                "player-app::obj-3::obj-407::obj-96::obj-89::obj-3": {
                    "parameter_longname": "live.text[15]"
                },
                "player-app::obj-3::obj-85::obj-1": {
                    "parameter_longname": "live.text[31]"
                },
                "player-app::obj-3::obj-85::obj-2": {
                    "parameter_longname": "live.text[53]"
                },
                "player-app::obj-3::obj-85::obj-3": {
                    "parameter_longname": "live.text[32]"
                },
                "player-app::obj-3::obj-87::obj-1": {
                    "parameter_longname": "live.text[2]"
                },
                "player-app::obj-3::obj-87::obj-2": {
                    "parameter_longname": "live.text[1]"
                },
                "player-app::obj-3::obj-87::obj-3": {
                    "parameter_longname": "live.text[3]"
                },
                "player-app::obj-3::obj-89::obj-1": {
                    "parameter_longname": "live.text[6]"
                },
                "player-app::obj-3::obj-89::obj-2": {
                    "parameter_longname": "live.text[4]"
                },
                "player-app::obj-3::obj-89::obj-3": {
                    "parameter_longname": "live.text[5]"
                },
                "player-app::obj-3::obj-91::obj-1": {
                    "parameter_longname": "live.text[8]"
                },
                "player-app::obj-3::obj-91::obj-2": {
                    "parameter_longname": "live.text[7]"
                },
                "player-app::obj-3::obj-91::obj-3": {
                    "parameter_longname": "live.text[9]"
                },
                "player-app::obj-3::obj-94::obj-1": {
                    "parameter_longname": "live.text[64]"
                },
                "player-app::obj-3::obj-94::obj-2": {
                    "parameter_longname": "live.text[63]"
                },
                "player-app::obj-3::obj-94::obj-3": {
                    "parameter_longname": "live.text[54]"
                },
                "player-app::obj-6::obj-98": {
                    "parameter_longname": "live.text[33]"
                },
                "server-app::obj-13::obj-1": {
                    "parameter_invisible": 0,
                    "parameter_modmode": 0,
                    "parameter_unitstyle": 10
                },
                "server-app::obj-2::obj-395::obj-2": {
                    "parameter_longname": "live.text[39]"
                },
                "server-app::obj-2::obj-395::obj-375": {
                    "parameter_longname": "mc.live.gain~[2]"
                },
                "server-app::obj-2::obj-395::obj-441": {
                    "parameter_longname": "mc.live.gain~[1]"
                },
                "server-app::obj-2::obj-395::obj-469": {
                    "parameter_longname": "live.text[40]"
                },
                "server-app::obj-2::obj-395::obj-472": {
                    "parameter_longname": "live.text[42]"
                },
                "server-app::obj-2::obj-395::obj-490": {
                    "parameter_longname": "live.text[41]"
                }
            },
            "inherited_shortname": 1
        },
        "autosave": 0,
        "bgcolor": [ 0.086, 0.086, 0.106, 1.0 ]
    }
}