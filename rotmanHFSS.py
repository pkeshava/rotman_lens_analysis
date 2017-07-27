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
                "X:="            , "-10.596231487245488mm",            
                "Y:="            , "-36.10494766807361mm",            
                "Z:="            , "1.27mm"
            ],
            [
                "NAME:PLPoint",            
                "X:="            , "-6.045728008799338mm",            
                "Y:="            , "-27.268957319607058mm",            
                "Z:="            , "1.27mm"
            ],
            [
                "NAME:PLPoint",            
                "X:="            , "-2.7055128580534613mm",            
                "Y:="            , "-18.32202064788649mm",            
                "Z:="            , "1.27mm"
            ],
            [
                "NAME:PLPoint",            
                "X:="            , "-0.6785816176476185mm",            
                "Y:="            , "-9.210438434166644mm",            
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
                "X:="            , "-0.6785816176476174mm",            
                "Y:="            , "9.210438434166633mm",            
                "Z:="            , "1.27mm"
            ],
            [
                "NAME:PLPoint",            
                "X:="            , "-2.7055128580534586mm",            
                "Y:="            , "18.32202064788648mm",            
                "Z:="            , "1.27mm"
            ],
            [
                "NAME:PLPoint",            
                "X:="            , "-6.045728008799336mm",            
                "Y:="            , "27.268957319607058mm",            
                "Z:="            , "1.27mm"
            ],
            [
                "NAME:PLPoint",            
                "X:="            , "-10.596231487245488mm",            
                "Y:="            , "36.10494766807361mm",            
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
                "X:="            , "-70.17643356758613mm",            
                "Y:="            , "25.134467409903348mm",            
                "Z:="            , "1.27mm"
            ],
            [
                "NAME:PLPoint",            
                "X:="            , "-73.53060075927151mm",            
                "Y:="            , "19.36531676102271mm",            
                "Z:="            , "1.27mm"
            ],
            [
                "NAME:PLPoint",            
                "X:="            , "-75.98208544154882mm",            
                "Y:="            , "13.158565629245459mm",            
                "Z:="            , "1.27mm"
            ],
            [
                "NAME:PLPoint",            
                "X:="            , "-77.47549110869511mm",            
                "Y:="            , "6.6544687455425615mm",            
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
                "X:="            , "-77.47549110869511mm",            
                "Y:="            , "-6.654468745542559mm",            
                "Z:="            , "1.27mm"
            ],
            [
                "NAME:PLPoint",            
                "X:="            , "-75.98208544154882mm",            
                "Y:="            , "-13.158565629245453mm",            
                "Z:="            , "1.27mm"
            ],
            [
                "NAME:PLPoint",            
                "X:="            , "-73.53060075927151mm",            
                "Y:="            , "-19.365316761022704mm",            
                "Z:="            , "1.27mm"
            ],
            [
                "NAME:PLPoint",            
                "X:="            , "-70.17643356758613mm",            
                "Y:="            , "-25.13446740990334mm",            
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
            [
                "NAME:PLSegment",            
                "SegmentType:="     , "Line",            
                "StartIndex:="      , 18,            
                "NoOfPoints:="      , 2
            ],
            [
                "NAME:PLSegment",            
                "SegmentType:="     , "Line",            
                "StartIndex:="      , 19,            
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