$Env:KOMOREBI_CONFIG_HOME = "$Env:USERPROFILE\.config\komorebi"

$PSReadLineOptions = @{
    EditMode = "Vi"
    # Colors = @{
    #     "Command" = "#8181f7"
    # }
}

Set-PSReadLineOption @PSReadLineOptions

