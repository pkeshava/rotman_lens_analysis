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
                "X:="            , "-4.859286365421675mm",            
                "Y:="            , "-27.40231679719899mm",            
                "Z:="            , "1.27mm"
            ],
            [
                "NAME:PLPoint",            
                "X:="            , "-2.1679415285956414mm",            
                "Y:="            , "-18.36844644753665mm",            
                "Z:="            , "1.27mm"
            ],
            [
                "NAME:PLPoint",            
                "X:="            , "-0.5430578942939457mm",            
                "Y:="            , "-9.21663186783757mm",            
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
                "X:="            , "-0.5430578942939457mm",            
                "Y:="            , "9.21663186783757mm",            
                "Z:="            , "1.27mm"
            ],
            [
                "NAME:PLPoint",            
                "X:="            , "-2.1679415285956405mm",            
                "Y:="            , "18.368446447536645mm",            
                "Z:="            , "1.27mm"
            ],
            [
                "NAME:PLPoint",            
                "X:="            , "-4.859286365421675mm",            
                "Y:="            , "27.40231679719899mm",            
                "Z:="            , "1.27mm"
            ],
            [
                "NAME:PLPoint",            
                "X:="            , "-75.97139003254475mm",            
                "Y:="            , "43.86210248599975mm",            
                "Z:="            , "1.27mm"
            ],
            [
                "NAME:PLPoint",            
                "X:="            , "-83.61682308716051mm",            
                "Y:="            , "36.683375777458416mm",            
                "Z:="            , "1.27mm"
            ],
            [
                "NAME:PLPoint",            
                "X:="            , "-89.52751315760011mm",            
                "Y:="            , "28.609899586730208mm",            
                "Z:="            , "1.27mm"
            ],
            [
                "NAME:PLPoint",            
                "X:="            , "-93.89229071169159mm",            
                "Y:="            , "19.6062341212463mm",            
                "Z:="            , "1.27mm"
            ],
            [
                "NAME:PLPoint",            
                "X:="            , "-96.56924440664248mm",            
                "Y:="            , "9.965114174573237mm",            
                "Z:="            , "1.27mm"
            ],
            [
                "NAME:PLPoint",            
                "X:="            , "-97.47133885777724mm",            
                "Y:="            , "0.0mm",            
                "Z:="            , "1.27mm"
            ],
            [
                "NAME:PLPoint",            
                "X:="            , "-96.56924440664248mm",            
                "Y:="            , "-9.965114174573232mm",            
                "Z:="            , "1.27mm"
            ],
            [
                "NAME:PLPoint",            
                "X:="            , "-93.89229071169159mm",            
                "Y:="            , "-19.606234121246295mm",            
                "Z:="            , "1.27mm"
            ],
            [
                "NAME:PLPoint",            
                "X:="            , "-89.52751315760011mm",            
                "Y:="            , "-28.609899586730208mm",            
                "Z:="            , "1.27mm"
            ],
            [
                "NAME:PLPoint",            
                "X:="            , "-83.61682308716051mm",            
                "Y:="            , "-36.6833757774584mm",            
                "Z:="            , "1.27mm"
            ],
            [
                "NAME:PLPoint",            
                "X:="            , "-75.97139003254475mm",            
                "Y:="            , "-43.86210248599975mm",            
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
            [
                "NAME:PLSegment",            
                "SegmentType:="     , "Line",            
                "StartIndex:="      , 12,            
                "NoOfPoints:="      , 2
            ],
            [
                "NAME:PLSegment",            
                "SegmentType:="     , "Line",            
                "StartIndex:="      , 13,            
                "NoOfPoints:="      , 2
            ],
            [
                "NAME:PLSegment",            
                "SegmentType:="     , "Line",            
                "StartIndex:="      , 14,            
                "NoOfPoints:="      , 2
            ],
            [
                "NAME:PLSegment",            
                "SegmentType:="     , "Line",            
                "StartIndex:="      , 15,            
                "NoOfPoints:="      , 2
            ],
            [
                "NAME:PLSegment",            
                "SegmentType:="     , "Line",            
                "StartIndex:="      , 16,            
                "NoOfPoints:="      , 2
            ],
            [
                "NAME:PLSegment",            
                "SegmentType:="     , "Line",            
                "StartIndex:="      , 17,            
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