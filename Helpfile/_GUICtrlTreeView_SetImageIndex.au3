#include <GUIConstantsEx.au3>
#include <GuiTreeView.au3>
#include <GuiImageList.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hItem[6], $hImage, $hRandomImage, $hRandomItem, $hTreeView
	Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS, $TVS_CHECKBOXES)

	GUICreate("TreeView Set Image Index", 400, 300)

	$hTreeView = GUICtrlCreateTreeView(2, 2, 396, 268, $iStyle, $WS_EX_CLIENTEDGE)
	GUISetState(@SW_SHOW)

	$hImage = _GUIImageList_Create(16, 16, 5, 3)
	_GUIImageList_AddIcon($hImage, "shell32.dll", 110)
	_GUIImageList_AddIcon($hImage, "shell32.dll", 131)
	_GUIImageList_AddIcon($hImage, "shell32.dll", 165)
	_GUIImageList_AddIcon($hImage, "shell32.dll", 168)
	_GUIImageList_AddIcon($hImage, "shell32.dll", 137)
	_GUIImageList_AddIcon($hImage, "shell32.dll", 146)
	_GUIImageList_AddIcon($hImage, "shell32.dll", 3)
	_GUICtrlTreeView_SetNormalImageList($hTreeView, $hImage)

	_GUICtrlTreeView_BeginUpdate($hTreeView)
	For $x = 0 To UBound($hItem) - 1
		$hRandomImage = Random(0, 5, 1)
		$hItem[$x] = _GUICtrlTreeView_Add($hTreeView, 0, StringFormat("[%02d] New Item", $x + 1), $hRandomImage, $hRandomImage)
	Next
	_GUICtrlTreeView_EndUpdate($hTreeView)

	$hRandomItem = Random(0, UBound($hItem) - 1, 1)
	MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("Item %d Image Index? %s", $hRandomItem, _GUICtrlTreeView_GetImageIndex($hTreeView, $hItem[$hRandomItem])))
	_GUICtrlTreeView_SetImageIndex($hTreeView, $hItem[$hRandomItem], 6)
	MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("Item %d Image Index? %s", $hRandomItem, _GUICtrlTreeView_GetImageIndex($hTreeView, $hItem[$hRandomItem])))

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
