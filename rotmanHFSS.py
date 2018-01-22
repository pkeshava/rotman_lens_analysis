import ScriptEnv
ScriptEnv.Initialize("Ansoft.ElectronicsDesktop")
oDesktop.RestoreWindow()
oProject = oDesktop.SetActiveProject("Rotman5p3")
oDesign = oProject.SetActiveDesign("Rotman5p3")
oEditor = oDesign.SetActiveEditor("3D Modeler")
oEditor.CreatePolyline(
    [
        "NAME:PolylineParameters",
        "IsPolylineCovered:="    , True,
        "IsPolylineClosed:="     , True,
        [
            "NAME:PolylinePoints",
            [
                "NAME:PLPoint",
                "X:="            , "-0.755402178136028mm",
                "Y:="            , "-10.253129577657203mm",
                "Z:="            , "1.27mm"
            ],
            [
                "NAME:PLPoint",
                "X:="            , "-0.0mm",
                "Y:="            , "0.0mm",
                "Z:="            , "1.27mm"
            ],
            [
                "NAME:PLPoint",
                "X:="            , "-0.7554021781360275mm",
                "Y:="            , "10.2531295776572mm",
                "Z:="            , "1.27mm"
            ],
            [
                "NAME:PLPoint",
                "X:="            , "-67.65753980256815mm",
                "Y:="            , "39.06209881772053mm",
                "Z:="            , "1.27mm"
            ],
            [
                "NAME:PLPoint",
                "X:="            , "-86.80466403937898mm",
                "Y:="            , "0.0mm",
                "Z:="            , "1.27mm"
            ],
            [
                "NAME:PLPoint",
                "X:="            , "-67.65753980256815mm",
                "Y:="            , "-39.06209881772053mm",
                "Z:="            , "1.27mm"
            ],
        ],
        [
            "NAME:PolylineSegments",
            [
                "NAME:PLSegment",
                "SegmentType:="     , "Line",
                "StartIndex:="      , 0,
                "NoOfPoints:="      , 2
            ],
            [
                "NAME:PLSegment",
                "SegmentType:="     , "Line",
                "StartIndex:="      , 1,
                "NoOfPoints:="      , 2
            ],
            [
                "NAME:PLSegment",
                "SegmentType:="     , "Line",
                "StartIndex:="      , 2,
                "NoOfPoints:="      , 2
            ],
            [
                "NAME:PLSegment",
                "SegmentType:="     , "Line",
                "StartIndex:="      , 3,
                "NoOfPoints:="      , 2
            ],
            [
                "NAME:PLSegment",
                "SegmentType:="     , "Line",
                "StartIndex:="      , 4,
                "NoOfPoints:="      , 2
            ],
            [
                "NAME:PLSegment",
                "SegmentType:="     , "Line",
                "StartIndex:="      , 5,
                "NoOfPoints:="      , 2
            ],
        ],
        [
            "NAME:PolylineXSection",
            "XSectionType:="	, "None",
            "XSectionOrient:="	, "Auto",
            "XSectionWidth:="	, "0mm",
            "XSectionTopWidth:="	, "0mm",
            "XSectionHeight:="	, "0mm",
            "XSectionNumSegments:="	, "0",
            "XSectionBendType:="	, "Corner"
        ]
    ],
    [
        "NAME:Attributes",
        "Name:="		, "Polyline1",
        "Flags:="		, "",
        "Color:="		, "(143 175 143)",
        "Transparency:="	, 0,
        "PartCoordinateSystem:=", "Global",
        "UDMId:="		, "",
        "IsAlwaysHiden:="	, False,
        "MaterialValue:="	, "\"vacuum\"",
        "SolveInside:="		, True
    ])
oProject.Save()
