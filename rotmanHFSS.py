import ScriptEnv
ScriptEnv.Initialize("Ansoft.ElectronicsDesktop")
oDesktop.RestoreWindow()
oProject = oDesktop.SetActiveProject("RL_template")
oDesign = oProject.SetActiveDesign("RL_template")
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
                "X:="            , "-2.7055128580534626mm",            
                "Y:="            , "-18.32202064788648mm",            
                "Z:="            , "1.27mm"
            ],
            [
                "NAME:PLPoint",            
                "X:="            , "-0.6785816176476178mm",            
                "Y:="            , "-9.210438434166637mm",            
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
                "X:="            , "-0.6785816176476185mm",            
                "Y:="            , "9.210438434166644mm",            
                "Z:="            , "1.27mm"
            ],
            [
                "NAME:PLPoint",            
                "X:="            , "-2.7055128580534613mm",            
                "Y:="            , "18.32202064788649mm",            
                "Z:="            , "1.27mm"
            ],
            [
                "NAME:PLPoint",            
                "X:="            , "-60.777112026035795mm",            
                "Y:="            , "35.089681988799796mm",            
                "Z:="            , "1.27mm"
            ],
            [
                "NAME:PLPoint",            
                "X:="            , "-70.02976950865423mm",            
                "Y:="            , "25.346668135266764mm",            
                "Z:="            , "1.27mm"
            ],
            [
                "NAME:PLPoint",            
                "X:="            , "-75.94367676643209mm",            
                "Y:="            , "13.281690290811591mm",            
                "Z:="            , "1.27mm"
            ],
            [
                "NAME:PLPoint",            
                "X:="            , "-77.97707108622178mm",            
                "Y:="            , "0.0mm",            
                "Z:="            , "1.27mm"
            ],
            [
                "NAME:PLPoint",            
                "X:="            , "-75.94367676643209mm",            
                "Y:="            , "-13.281690290811587mm",            
                "Z:="            , "1.27mm"
            ],
            [
                "NAME:PLPoint",            
                "X:="            , "-70.02976950865423mm",            
                "Y:="            , "-25.34666813526676mm",            
                "Z:="            , "1.27mm"
            ],
            [
                "NAME:PLPoint",            
                "X:="            , "-60.777112026035795mm",            
                "Y:="            , "-35.089681988799796mm",            
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
            [
                "NAME:PLSegment",            
                "SegmentType:="     , "Line",            
                "StartIndex:="      , 6,            
                "NoOfPoints:="      , 2
            ],
            [
                "NAME:PLSegment",            
                "SegmentType:="     , "Line",            
                "StartIndex:="      , 7,            
                "NoOfPoints:="      , 2
            ],
            [
                "NAME:PLSegment",            
                "SegmentType:="     , "Line",            
                "StartIndex:="      , 8,            
                "NoOfPoints:="      , 2
            ],
            [
                "NAME:PLSegment",            
                "SegmentType:="     , "Line",            
                "StartIndex:="      , 9,            
                "NoOfPoints:="      , 2
            ],
            [
                "NAME:PLSegment",            
                "SegmentType:="     , "Line",            
                "StartIndex:="      , 10,            
                "NoOfPoints:="      , 2
            ],
            [
                "NAME:PLSegment",            
                "SegmentType:="     , "Line",            
                "StartIndex:="      , 11,            
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