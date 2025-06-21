class UISLRPCListener extends UIScreenListener;


event OnInit(UIScreen Screen)
{	
    
    if (Screen.Class.Name == 'UIStrategyMap' || Screen.Class.Name == 'UIAvengerHUD' || Screen.Class.Name == 'UIStrategyMap' || Screen.Class.Name == 'UILoadGame' || Screen.Class.Name == 'robojumper_UISquadSelect' || Screen.Class.Name == 'UIPauseMenu' || Screen.Class.Name == 'UIChosenReveal' || Screen.Class.Name == 'UIResistanceReport')
    {
	  `LOG("RPC-SCREEN:" @ Screen.Class.Name,, 'UISL-RPC');
    }
}
