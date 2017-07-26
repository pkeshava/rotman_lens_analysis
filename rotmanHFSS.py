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
"-10.596231487245486"