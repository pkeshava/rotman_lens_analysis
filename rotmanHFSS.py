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
                "X:="            , "-16.000510160645277mm",            
                "Y:="            , "-45.37082194273666mm",            
                "Z:="            , "1.27mm"
            ]
            [
                "NAME:PLPoint",            
                "X:="            , "-10.596231487245486mm",            
                "Y:="            , "-36.10494766807361mm",            
                "Z:="            , "1.27mm"
            ]
            [
                "NAME:PLPoint",            
                "X:="            , "-6.045728008799336mm",            
                "Y:="            , "-27.268957319607058mm",            
                "Z:="            , "1.27mm"
            ]
            [
                "NAME:PLPoint",            
                "X:="            , "-2.7055128580534586mm",            
                "Y:="            , "-18.32202064788648mm",            
                "Z:="            , "1.27mm"
            ]
            [
                "NAME:PLPoint",            
                "X:="            , "-0.6785816176476174mm",            
                "Y:="            , "-9.210438434166633mm",            
                "Z:="            , "1.27mm"
            ]
            [
                "NAME:PLPoint",            
                "X:="            , "-0.0mm",            
                "Y:="            , "0.0mm",            
                "Z:="            , "1.27mm"
            ]
            [
                "NAME:PLPoint",            
                "X:="            , "-0.6785816176476185mm",            
                "Y:="            , "9.210438434166644mm",            
                "Z:="            , "1.27mm"
            ]
            [
                "NAME:PLPoint",            
                "X:="            , "-2.7055128580534613mm",            
                "Y:="            , "18.32202064788649mm",            
                "Z:="            , "1.27mm"
            ]
            [
                "NAME:PLPoint",            
                "X:="            , "-6.04572800879934mm",            
                "Y:="            , "27.268957319607065mm",            
                "Z:="            , "1.27mm"
            ]
            [
                "NAME:PLPoint",            
                "X:="            , "-10.5962314872455mm",            
                "Y:="            , "36.10494766807362mm",            
                "Z:="            , "1.27mm"
            ]
            [
                "NAME:PLPoint",            
                "X:="            , "-16.000510160645288mm",            
                "Y:="            , "45.37082194273669mm",            
                "Z:="            , "1.27mm"
            ]
            [
                "NAME:PLPoint",            
                "X:="            , "-60.777112026035795mm",            
                "Y:="            , "35.089681988799796mm",            
                "Z:="            , "1.27mm"
            ]
            [
                "NAME:PLPoint",            
                "X:="            , "-75.98208544154882mm",            
                "Y:="            , "13.158565629245459mm",            
                "Z:="            , "1.27mm"
            ]
            [
                "NAME:PLPoint",            
                "X:="            , "-70.17643356758613mm",            
                "Y:="            , "25.134467409903348mm",            
                "Z:="            , "1.27mm"
            ]
            [
                "NAME:PLPoint",            
                "X:="            , "-77.97707108622178mm",            
                "Y:="            , "0.0mm",            
                "Z:="            , "1.27mm"
            ]
            [
                "NAME:PLPoint",            
                "X:="            , "-70.17643356758613mm",            
                "Y:="            , "-25.13446740990334mm",            
                "Z:="            , "1.27mm"
            ]
            [
                "NAME:PLPoint",            
                "X:="            , "-75.98208544154882mm",            
                "Y:="            , "-13.158565629245453mm",            
                "Z:="            , "1.27mm"
            ]
            [
                "NAME:PLPoint",            
                "X:="            , "-60.777112026035795mm",            
                "Y:="            , "-35.089681988799796mm",            
                "Z:="            , "1.27mm"
            ]
