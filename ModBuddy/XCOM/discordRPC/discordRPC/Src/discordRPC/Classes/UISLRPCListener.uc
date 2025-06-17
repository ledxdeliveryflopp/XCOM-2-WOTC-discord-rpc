class UISLRPCListener extends UIScreenListener;


var string UiClasses;


event OnInit(UIScreen Screen)
{	
    
    `LOG("Screen initialized:" @ Screen.Class.Name,, 'UISL-RPC');
    if (Screen.Class.Name == 'UIStrategyMap')
    {
	  `LOG("RPC-SCREEN:" @ Screen.Class.Name,, 'UISL-RPC');
    }
}


defaultproperties
{
    UiClasses = "data.txt"
}