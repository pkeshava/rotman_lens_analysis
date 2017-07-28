# Copyright Pouyan Keshavarzian 2017
# University of Calgary M.Sc. Studies
# functions for wrighting to a file that becomes a python script you import into
# HFSS

def HFSS_scripter(X,Y):
    f = open('rotmanHFSS.py', 'w')
    f.write('import ScriptEnv\nScriptEnv.Initialize("Ansoft.ElectronicsDesktop")\noDesktop.RestoreWindow()\noProject = oDesktop.SetActiveProject("RL_template")\noDesign = oProject.SetActiveDesign("RL_template")\noEditor = oDesign.SetActiveEditor("3D Modeler")\noEditor.CreatePolyline(\n')
    f.write('    [\n        "NAME:PolylineParameters",\n        "IsPolylineCovered:="    , True,\n        "IsPolylineClosed:="     , True,\n')
    f.write('        [\n            "NAME:PolylinePoints",\n')
    for i in range(len(X)):
        f.write('            [\n                "NAME:PLPoint",')
        f.write('            \n                "X:="            , "{}mm",'.format(X[i]))
        f.write('            \n                "Y:="            , "{}mm",'.format(Y[i]))
        f.write('            \n                "Z:="            , "1.27mm"\n')
        f.write('            ],\n')
    f.write('        ],\n')
    f.write('        [\n            "NAME:PolylineSegments",\n')
    for i in range(len(X)):
        f.write('            [\n                "NAME:PLSegment",')
        f.write('            \n                "SegmentType:="     , "Line",')
        f.write('            \n                "StartIndex:="      , %d,' % i)
        f.write('            \n                "NoOfPoints:="      , 2\n')
        f.write('            ],\n')
    f.write('        ],\n')
    f.write('        [\n            "NAME:PolylineXSection",\n')
    f.write('            "XSectionType:="	, "None",\n')
    f.write('            "XSectionOrient:="	, "Auto",\n')
    f.write('            "XSectionWidth:="	, "0mm",\n')
    f.write('            "XSectionTopWidth:="	, "0mm",\n')
    f.write('            "XSectionHeight:="	, "0mm",\n')
    f.write('            "XSectionNumSegments:="	, "0",\n')
    f.write('            "XSectionBendType:="	, "Corner"\n')
    f.write('        ]\n')
    f.write('    ],\n')
    f.write('    [\n')
    f.write('        "NAME:Attributes",\n')
    f.write('        "Name:="		, "Polyline1",\n')
    f.write('        "Flags:="		, "",\n')
    f.write('        "Color:="		, "(143 175 143)",\n')
    f.write('        "Transparency:="	, 0,\n')
    f.write('        "PartCoordinateSystem:=", "Global",\n')
    f.write('        "UDMId:="		, "",\n')
    f.write('        "IsAlwaysHiden:="	, False,\n')
    f.write('        "MaterialValue:="	, "\\"vacuum\\"",\n')
    f.write('        "SolveInside:="		, True\n')
    f.write('    ])\n')
    f.write('oProject.Save()')
    f.close
