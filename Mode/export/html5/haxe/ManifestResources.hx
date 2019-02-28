package;


import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

@:access(lime.utils.Assets)


@:keep @:dox(hide) class ManifestResources {


	public static var preloadLibraries:Array<AssetLibrary>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;


	public static function init (config:Dynamic):Void {

		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();

		rootPath = null;

		if (config != null && Reflect.hasField (config, "rootPath")) {

			rootPath = Reflect.field (config, "rootPath");

		}

		if (rootPath == null) {

			#if (ios || tvos || emscripten)
			rootPath = "assets/";
			#elseif console
			rootPath = lime.system.System.applicationDirectory;
			#elseif (sys && windows && !cs)
			rootPath = FileSystem.absolutePath (haxe.io.Path.directory (#if (haxe_ver >= 3.3) Sys.programPath () #else Sys.executablePath () #end)) + "/";
			#else
			rootPath = "";
			#end

		}

		Assets.defaultRootPath = rootPath;

		#if (openfl && !flash && !display)
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		#end

		var data, manifest, library;

		#if kha

		null
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("null", library);

		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("null");

		#else

		data = '{"name":null,"assets":"aoy4:sizei39706y4:typey5:MUSICy2:idy28:flixel%2Fsounds%2Fflixel.mp3y9:pathGroupaR4y28:flixel%2Fsounds%2Fflixel.ogghy7:preloadtgoR0i2114R1R2R3y26:flixel%2Fsounds%2Fbeep.mp3R5aR8y26:flixel%2Fsounds%2Fbeep.ogghR7tgoR0i5794R1y5:SOUNDR3R9R5aR8R9hgoR0i33629R1R10R3R6R5aR4R6hgoR0i15744R1y4:FONTy9:classNamey35:__ASSET__flixel_fonts_nokiafc22_ttfR3y30:flixel%2Ffonts%2Fnokiafc22.ttfR7tgoR0i29724R1R11R12y36:__ASSET__flixel_fonts_monsterrat_ttfR3y31:flixel%2Ffonts%2Fmonsterrat.ttfR7tgoy4:pathy33:flixel%2Fimages%2Fui%2Fbutton.pngR0i519R1y5:IMAGER3R18R7tgoR17y36:flixel%2Fimages%2Flogo%2Fdefault.pngR0i3280R1R19R3R20R7tgoR17y26:assets%2Fimages%2Fgibs.pngR0i3630R1R19R3R21R7tgoR17y34:assets%2Fimages%2Fspawner_gibs.pngR0i226R1R19R3R22R7tgoR17y29:assets%2Fimages%2Fspawner.pngR0i508R1R19R3R23R7tgoR17y32:assets%2Fimages%2Ftech_tiles.pngR0i184R1R19R3R24R7tgoR17y28:assets%2Fimages%2Fbullet.pngR0i223R1R19R3R25R7tgoR17y32:assets%2Fimages%2Fbot_bullet.pngR0i176R1R19R3R26R7tgoR17y30:assets%2Fimages%2Fspaceman.pngR0i3725R1R19R3R27R7tgoR17y28:assets%2Fimages%2Fcursor.pngR0i180R1R19R3R28R7tgoR17y25:assets%2Fimages%2Fjet.pngR0i162R1R19R3R29R7tgoR17y25:assets%2Fimages%2Fbot.pngR0i1309R1R19R3R30R7tgoR17y31:assets%2Fimages%2Fimg_tiles.pngR0i600R1R19R3R31R7tgoR17y30:assets%2Fimages%2Fdirt_top.pngR0i162R1R19R3R32R7tgoR17y31:assets%2Fimages%2Fminiframe.pngR0i169R1R19R3R33R7tgoR17y26:assets%2Fimages%2Fdirt.pngR0i193R1R19R3R34R7tgoR17y25:assets%2Fdata%2Fdemo1.fgrR0i114972R1y4:TEXTR3R35R7tgoR17y25:assets%2Fdata%2Fdemo2.fgrR0i72188R1R36R3R37R7tgoR0i2532R1R2R3y31:assets%2Fsounds%2Fcountdown.mp3R5aR38y31:assets%2Fsounds%2Fcountdown.ogghR7tgoR0i5040R1R2R3y25:assets%2Fsounds%2Fhit.mp3R5aR40y25:assets%2Fsounds%2Fhit.ogghR7tgoR0i20923R1R2R3y30:assets%2Fsounds%2Fmenu_hit.mp3R5aR42y30:assets%2Fsounds%2Fmenu_hit.ogghR7tgoR0i2114R1R2R3y26:assets%2Fsounds%2Fjump.mp3R5aR44y26:assets%2Fsounds%2Fjump.ogghR7tgoR0i2114R1R2R3y28:assets%2Fsounds%2Fbutton.mp3R5aR46y28:assets%2Fsounds%2Fbutton.ogghR7tgoR0i6659R1R2R3y27:assets%2Fsounds%2Fenemy.mp3R5aR48y27:assets%2Fsounds%2Fenemy.ogghR7tgoR0i2533R1R2R3y25:assets%2Fsounds%2Fjam.mp3R5aR50y25:assets%2Fsounds%2Fjam.ogghR7tgoR0i2114R1R2R3y27:assets%2Fsounds%2Fshoot.mp3R5aR52y27:assets%2Fsounds%2Fshoot.ogghR7tgoR0i139597R1R2R3y26:assets%2Fsounds%2Fmode.mp3R5aR54y26:assets%2Fsounds%2Fmode.ogghR7tgoR0i4204R1R2R3y26:assets%2Fsounds%2Fhurt.mp3R5aR56y26:assets%2Fsounds%2Fhurt.ogghR7tgoR0i7966R1R2R3y29:assets%2Fsounds%2Fasplode.mp3R5aR58y29:assets%2Fsounds%2Fasplode.ogghR7tgoR0i7130R1R2R3y25:assets%2Fsounds%2Fjet.mp3R5aR60y25:assets%2Fsounds%2Fjet.ogghR7tgoR0i19251R1R2R3y32:assets%2Fsounds%2Fmenu_hit_2.mp3R5aR62y32:assets%2Fsounds%2Fmenu_hit_2.ogghR7tgoR0i13626R1R10R3R63R5aR62R63hgoR0i6065R1R10R3R57R5aR56R57hgoR0i8023R1R10R3R59R5aR58R59hgoR0i81299R1R10R3R55R5aR54R55hgoR0i4733R1R10R3R45R5aR44R45hgoR0i4642R1R10R3R51R5aR50R51hgoR0i7654R1R10R3R61R5aR60R61hgoR0i4946R1R10R3R39R5aR38R39hgoR0i4165R1R10R3R53R5aR52R53hgoR0i15343R1R10R3R43R5aR42R43hgoR0i5565R1R10R3R49R5aR48R49hgoR0i6307R1R10R3R41R5aR40R41hgoR0i4646R1R10R3R47R5aR46R47hgh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("default", library);
		

		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		

		#end

	}


}


#if kha

null

#else

#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_sounds_beep_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_gibs_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_spawner_gibs_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_spawner_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_tech_tiles_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_bullet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_bot_bullet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_spaceman_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_cursor_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_jet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_bot_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_img_tiles_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_dirt_top_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_miniframe_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_dirt_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_data_demo1_fgr extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_demo2_fgr extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_countdown_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_hit_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_menu_hit_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_jump_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_button_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_enemy_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_jam_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_shoot_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_mode_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_hurt_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_asplode_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_jet_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_menu_hit_2_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_menu_hit_2_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_hurt_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_asplode_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_mode_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_jump_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_jam_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_jet_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_countdown_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_shoot_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_menu_hit_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_enemy_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_hit_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_button_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:keep @:file("/home/aluno-uffs/haxelib/flixel/4,6,0/assets/sounds/flixel.mp3") #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends haxe.io.Bytes {}
@:keep @:file("/home/aluno-uffs/haxelib/flixel/4,6,0/assets/sounds/beep.mp3") #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends haxe.io.Bytes {}
@:keep @:file("/home/aluno-uffs/haxelib/flixel/4,6,0/assets/sounds/beep.ogg") #if display private #end class __ASSET__flixel_sounds_beep_ogg extends haxe.io.Bytes {}
@:keep @:file("/home/aluno-uffs/haxelib/flixel/4,6,0/assets/sounds/flixel.ogg") #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends haxe.io.Bytes {}
@:keep @:font("export/html5/obj/webfont/nokiafc22.ttf") #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:keep @:font("export/html5/obj/webfont/monsterrat.ttf") #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:keep @:image("/home/aluno-uffs/haxelib/flixel/4,6,0/assets/images/ui/button.png") #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:keep @:image("/home/aluno-uffs/haxelib/flixel/4,6,0/assets/images/logo/default.png") #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}
@:keep @:image("assets/images/gibs.png") #if display private #end class __ASSET__assets_images_gibs_png extends lime.graphics.Image {}
@:keep @:image("assets/images/spawner_gibs.png") #if display private #end class __ASSET__assets_images_spawner_gibs_png extends lime.graphics.Image {}
@:keep @:image("assets/images/spawner.png") #if display private #end class __ASSET__assets_images_spawner_png extends lime.graphics.Image {}
@:keep @:image("assets/images/tech_tiles.png") #if display private #end class __ASSET__assets_images_tech_tiles_png extends lime.graphics.Image {}
@:keep @:image("assets/images/bullet.png") #if display private #end class __ASSET__assets_images_bullet_png extends lime.graphics.Image {}
@:keep @:image("assets/images/bot_bullet.png") #if display private #end class __ASSET__assets_images_bot_bullet_png extends lime.graphics.Image {}
@:keep @:image("assets/images/spaceman.png") #if display private #end class __ASSET__assets_images_spaceman_png extends lime.graphics.Image {}
@:keep @:image("assets/images/cursor.png") #if display private #end class __ASSET__assets_images_cursor_png extends lime.graphics.Image {}
@:keep @:image("assets/images/jet.png") #if display private #end class __ASSET__assets_images_jet_png extends lime.graphics.Image {}
@:keep @:image("assets/images/bot.png") #if display private #end class __ASSET__assets_images_bot_png extends lime.graphics.Image {}
@:keep @:image("assets/images/img_tiles.png") #if display private #end class __ASSET__assets_images_img_tiles_png extends lime.graphics.Image {}
@:keep @:image("assets/images/dirt_top.png") #if display private #end class __ASSET__assets_images_dirt_top_png extends lime.graphics.Image {}
@:keep @:image("assets/images/miniframe.png") #if display private #end class __ASSET__assets_images_miniframe_png extends lime.graphics.Image {}
@:keep @:image("assets/images/dirt.png") #if display private #end class __ASSET__assets_images_dirt_png extends lime.graphics.Image {}
@:keep @:file("assets/data/demo1.fgr") #if display private #end class __ASSET__assets_data_demo1_fgr extends haxe.io.Bytes {}
@:keep @:file("assets/data/demo2.fgr") #if display private #end class __ASSET__assets_data_demo2_fgr extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/countdown.mp3") #if display private #end class __ASSET__assets_sounds_countdown_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/hit.mp3") #if display private #end class __ASSET__assets_sounds_hit_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/menu_hit.mp3") #if display private #end class __ASSET__assets_sounds_menu_hit_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/jump.mp3") #if display private #end class __ASSET__assets_sounds_jump_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/button.mp3") #if display private #end class __ASSET__assets_sounds_button_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/enemy.mp3") #if display private #end class __ASSET__assets_sounds_enemy_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/jam.mp3") #if display private #end class __ASSET__assets_sounds_jam_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/shoot.mp3") #if display private #end class __ASSET__assets_sounds_shoot_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/mode.mp3") #if display private #end class __ASSET__assets_sounds_mode_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/hurt.mp3") #if display private #end class __ASSET__assets_sounds_hurt_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/asplode.mp3") #if display private #end class __ASSET__assets_sounds_asplode_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/jet.mp3") #if display private #end class __ASSET__assets_sounds_jet_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/menu_hit_2.mp3") #if display private #end class __ASSET__assets_sounds_menu_hit_2_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/menu_hit_2.ogg") #if display private #end class __ASSET__assets_sounds_menu_hit_2_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/hurt.ogg") #if display private #end class __ASSET__assets_sounds_hurt_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/asplode.ogg") #if display private #end class __ASSET__assets_sounds_asplode_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/mode.ogg") #if display private #end class __ASSET__assets_sounds_mode_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/jump.ogg") #if display private #end class __ASSET__assets_sounds_jump_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/jam.ogg") #if display private #end class __ASSET__assets_sounds_jam_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/jet.ogg") #if display private #end class __ASSET__assets_sounds_jet_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/countdown.ogg") #if display private #end class __ASSET__assets_sounds_countdown_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/shoot.ogg") #if display private #end class __ASSET__assets_sounds_shoot_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/menu_hit.ogg") #if display private #end class __ASSET__assets_sounds_menu_hit_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/enemy.ogg") #if display private #end class __ASSET__assets_sounds_enemy_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/hit.ogg") #if display private #end class __ASSET__assets_sounds_hit_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/button.ogg") #if display private #end class __ASSET__assets_sounds_button_ogg extends haxe.io.Bytes {}
@:keep @:file("") #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else

@:keep @:expose('__ASSET__flixel_fonts_nokiafc22_ttf') #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/nokiafc22"; #else ascender = 2048; descender = -512; height = 2816; numGlyphs = 172; underlinePosition = -640; underlineThickness = 256; unitsPerEM = 2048; #end name = "Nokia Cellphone FC Small"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_monsterrat_ttf') #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/monsterrat"; #else ascender = 968; descender = -251; height = 1219; numGlyphs = 263; underlinePosition = -150; underlineThickness = 50; unitsPerEM = 1000; #end name = "Monsterrat"; super (); }}


#end

#if (openfl && !flash)

#if html5
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#else
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#end

#end
#end

#end
