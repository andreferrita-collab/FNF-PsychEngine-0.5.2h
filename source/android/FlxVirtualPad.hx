package android;

import flixel.FlxG;
import flixel.graphics.frames.FlxTileFrames;
import flixel.group.FlxSpriteGroup;
import flixel.math.FlxPoint;
import flixel.util.FlxDestroyUtil;
import android.flixel.FlxButton;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.graphics.FlxGraphic;

// Imports necessários para o Psych Engine (Ajuste a pasta se necessário)
import backend.ClientPrefs; 
import backend.Paths;

class FlxVirtualPad extends FlxSpriteGroup {
	//Actions
	public var buttonA:FlxButton;
	public var buttonB:FlxButton;
	public var buttonC:FlxButton;
	public var buttonD:FlxButton;
	public var buttonE:FlxButton;
	public var buttonV:FlxButton;
	public var buttonX:FlxButton;
	public var buttonY:FlxButton;
	public var buttonZ:FlxButton;

	//DPad
	public var buttonLeft:FlxButton;
	public var buttonUp:FlxButton;
	public var buttonRight:FlxButton;
	public var buttonDown:FlxButton;

	//PAD DUO MODE
	public var buttonLeft2:FlxButton;
	public var buttonUp2:FlxButton;
	public var buttonRight2:FlxButton;
	public var buttonDown2:FlxButton;

	public var dPad:FlxSpriteGroup;
	public var actions:FlxSpriteGroup;

	public function new(DPad:FlxDPadMode, Action:FlxActionMode) {
		super();

		dPad = new FlxSpriteGroup();
		dPad.scrollFactor.set();

		actions = new FlxSpriteGroup();
		actions.scrollFactor.set();

		switch (DPad){
			case UP_DOWN:
				dPad.add(buttonUp = createButton(0, FlxG.height - 85 * 3, 44 * 3, 45 * 3, "up"));
				dPad.add(buttonDown = createButton(0, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "down"));
			case LEFT_RIGHT:
				dPad.add(buttonLeft = createButton(0, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "left"));
				dPad.add(buttonRight = createButton(42 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "right"));
			case UP_LEFT_RIGHT:
				dPad.add(buttonUp = createButton(35 * 3, FlxG.height - 81 * 3, 44 * 3, 45 * 3, "up"));
				dPad.add(buttonLeft = createButton(0, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "left"));
				dPad.add(buttonRight = createButton(69 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "right"));
			case FULL:
				dPad.add(buttonUp = createButton(35 * 3, FlxG.height - 116 * 3, 44 * 3, 45 * 3, "up"));
				dPad.add(buttonLeft = createButton(0, FlxG.height - 81 * 3, 44 * 3, 45 * 3, "left"));
				dPad.add(buttonRight = createButton(69 * 3, FlxG.height - 81 * 3, 44 * 3, 45 * 3, "right"));
				dPad.add(buttonDown = createButton(35 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "down"));
			case RIGHT_FULL:
				dPad.add(buttonUp = createButton(FlxG.width - 86 * 3, FlxG.height - 66 - 116 * 3, 44 * 3, 45 * 3, "up"));
				dPad.add(buttonLeft = createButton(FlxG.width - 128 * 3, FlxG.height - 66 - 81 * 3, 44 * 3, 45 * 3, "left"));
				dPad.add(buttonRight = createButton(FlxG.width - 44 * 3, FlxG.height - 66 - 81 * 3, 44 * 3, 45 * 3, "right"));
				dPad.add(buttonDown = createButton(FlxG.width - 86 * 3, FlxG.height - 66 - 45 * 3, 44 * 3, 45 * 3, "down"));
			case DUO:
				dPad.add(buttonUp = createButton(35 * 3, FlxG.height - 116 * 3, 44 * 3, 45 * 3, "up"));
				dPad.add(buttonLeft = createButton(0, FlxG.height - 81 * 3, 44 * 3, 45 * 3, "left"));
				dPad.add(buttonRight = createButton(69 * 3, FlxG.height - 81 * 3, 44 * 3, 45 * 3, "right"));
				dPad.add(buttonDown = createButton(35 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "down"));
				dPad.add(buttonUp2 = createButton(FlxG.width - 86 * 3, FlxG.height - 66 - 116 * 3, 44 * 3, 45 * 3, "up"));
				dPad.add(buttonLeft2 = createButton(FlxG.width - 128 * 3, FlxG.height - 66 - 81 * 3, 44 * 3, 45 * 3, "left"));
				dPad.add(buttonRight2 = createButton(FlxG.width - 44 * 3, FlxG.height - 66 - 81 * 3, 44 * 3, 45 * 3, "right"));
				dPad.add(buttonDown2 = createButton(FlxG.width - 86 * 3, FlxG.height - 66 - 45 * 3, 44 * 3, 45 * 3, "down"));
			case NONE:
		}

		switch (Action){
			case A:
				actions.add(buttonA = createButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "a"));
			case B:
				actions.add(buttonB = createButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "b"));
			case D:
				actions.add(buttonD = createButton(FlxG.width - 44 * 3, FlxG.height - 125 * 3, 44 * 3, 45 * 3, "d"));						
			case A_B:
				actions.add(buttonA = createButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "a"));
				actions.add(buttonB = createButton(FlxG.width - 86 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "b"));
			case A_B_C:
				actions.add(buttonC = createButton(FlxG.width - 128 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "c"));
				actions.add(buttonB = createButton(FlxG.width - 86 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "b"));								
				actions.add(buttonA = createButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "a"));				
			case A_B_E:
				actions.add(buttonE = createButton(FlxG.width - 128 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "e"));   
				actions.add(buttonB = createButton(FlxG.width - 86 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "b"));								
				actions.add(buttonA = createButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "a"));
 			case A_B_X_Y:
				actions.add(buttonY = createButton(FlxG.width - 170 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "y"));
				actions.add(buttonX = createButton(FlxG.width - 128 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "x"));
				actions.add(buttonB = createButton(FlxG.width - 86 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "b"));								
				actions.add(buttonA = createButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "a"));	 			               
			case A_B_C_X_Y:		
				actions.add(buttonY = createButton(FlxG.width - 86 * 3, FlxG.height - 85 * 3, 44 * 3, 45 * 3, "y"));
				actions.add(buttonX = createButton(FlxG.width - 44 * 3, FlxG.height - 85 * 3, 44 * 3, 45 * 3, "x"));
				actions.add(buttonC = createButton(FlxG.width - 128 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "c"));
				actions.add(buttonB = createButton(FlxG.width - 86 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "b"));
				actions.add(buttonA = createButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "a"));				
			case A_B_C_X_Y_Z:
				actions.add(buttonX = createButton(FlxG.width - 128 * 3, FlxG.height - 85 * 3, 44 * 3, 45 * 3, "x"));
				actions.add(buttonY = createButton(FlxG.width - 86 * 3, FlxG.height - 85 * 3, 44 * 3, 45 * 3, "y"));
				actions.add(buttonZ = createButton(FlxG.width - 44 * 3, FlxG.height - 85 * 3, 44 * 3, 45 * 3, "z"));
				actions.add(buttonC = createButton(FlxG.width - 128 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "c"));
				actions.add(buttonB = createButton(FlxG.width - 86 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "b"));								
				actions.add(buttonA = createButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "a"));	
			case FULL:
				actions.add(buttonV = createButton(FlxG.width - 170 * 3, FlxG.height - 85 * 3, 44 * 3, 45 * 3, "v"));            
				actions.add(buttonX = createButton(FlxG.width - 128 * 3, FlxG.height - 85 * 3, 44 * 3, 45 * 3, "x"));
				actions.add(buttonY = createButton(FlxG.width - 86 * 3, FlxG.height - 85 * 3, 44 * 3, 45 * 3, "y"));
				actions.add(buttonZ = createButton(FlxG.width - 44 * 3, FlxG.height - 85 * 3, 44 * 3, 45 * 3, "z"));
				actions.add(buttonD = createButton(FlxG.width - 170 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "d"));
				actions.add(buttonC = createButton(FlxG.width - 128 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "c"));
				actions.add(buttonB = createButton(FlxG.width - 86 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "b"));								
				actions.add(buttonA = createButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "a"));						
			case NONE:
		}

		// Adiciona os grupos ao container principal para que apareçam na tela
		add(dPad);
		add(actions);
	}

	public function createButton(x:Float, y:Float, width:Int, height:Int, frames:String):FlxButton {
		var button = new FlxButton(x, y);
		button.frames = FlxTileFrames.fromFrame(getFrames().getByName(frames), FlxPoint.get(width, height));
		button.resetSizeFromFrame();
		button.solid = false;
		button.immovable = true;
		button.scrollFactor.set();
		button.alpha = 0.75;
		button.antialiasing = ClientPrefs.globalAntialiasing;
		#if FLX_DEBUG
		button.ignoreDrawDebug = true;
		#end

		return button;
	}

	public static function getFrames():FlxAtlasFrames {
		return Paths.getPackerAtlas('androidcontrols/virtualpad');
	}

	override public function destroy():Void {
		super.destroy();

		dPad = FlxDestroyUtil.destroy(dPad);
		actions = FlxDestroyUtil.destroy(actions);

		dPad = null;
		actions = null;

		buttonA = null;
		buttonB = null;
		buttonC = null;
		buttonD = null;
		buttonE = null;

		buttonV = null;	
		buttonX = null;	
		buttonY = null;
		buttonZ	= null;	

		buttonLeft = null;
		buttonUp = null;
		buttonDown = null;
		buttonRight = null;

		buttonLeft2 = null;
		buttonUp2 = null;
		buttonDown2 = null;
		buttonRight2 = null;
	}
}

enum FlxDPadMode {
	UP_DOWN;
	LEFT_RIGHT;
	UP_LEFT_RIGHT;
	FULL;
	RIGHT_FULL;
	DUO;
	NONE;
}

enum FlxActionMode {
	A;
	B;
	D;
	A_B;
	A_B_C;
	A_B_E;
	A_B_X_Y;	
	A_B_C_X_Y;
	A_B_C_X_Y_Z;
	FULL;
	NONE;
}
