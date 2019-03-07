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

		data = '{"name":null,"assets":"aoy4:sizei39706y4:typey5:MUSICy9:classNamey33:__ASSET__flixel_sounds_flixel_mp3y2:idy28:flixel%2Fsounds%2Fflixel.mp3goR0i2114R1R2R3y31:__ASSET__flixel_sounds_beep_mp3R5y26:flixel%2Fsounds%2Fbeep.mp3goR0i15744R1y4:FONTR3y35:__ASSET__flixel_fonts_nokiafc22_ttfR5y30:flixel%2Ffonts%2Fnokiafc22.ttfgoR0i29724R1R9R3y36:__ASSET__flixel_fonts_monsterrat_ttfR5y31:flixel%2Ffonts%2Fmonsterrat.ttfgoR0i519R1y5:IMAGER3y36:__ASSET__flixel_images_ui_button_pngR5y33:flixel%2Fimages%2Fui%2Fbutton.pnggoR0i3280R1R14R3y39:__ASSET__flixel_images_logo_default_pngR5y36:flixel%2Fimages%2Flogo%2Fdefault.pnggoR0i3630R1R14R3y31:__ASSET__assets_images_gibs_pngR5y26:assets%2Fimages%2Fgibs.pnggoR0i226R1R14R3y39:__ASSET__assets_images_spawner_gibs_pngR5y34:assets%2Fimages%2Fspawner_gibs.pnggoR0i508R1R14R3y34:__ASSET__assets_images_spawner_pngR5y29:assets%2Fimages%2Fspawner.pnggoR0i184R1R14R3y37:__ASSET__assets_images_tech_tiles_pngR5y32:assets%2Fimages%2Ftech_tiles.pnggoR0i223R1R14R3y33:__ASSET__assets_images_bullet_pngR5y28:assets%2Fimages%2Fbullet.pnggoR0i176R1R14R3y37:__ASSET__assets_images_bot_bullet_pngR5y32:assets%2Fimages%2Fbot_bullet.pnggoR0i3725R1R14R3y35:__ASSET__assets_images_spaceman_pngR5y30:assets%2Fimages%2Fspaceman.pnggoR0i180R1R14R3y33:__ASSET__assets_images_cursor_pngR5y28:assets%2Fimages%2Fcursor.pnggoR0i162R1R14R3y30:__ASSET__assets_images_jet_pngR5y25:assets%2Fimages%2Fjet.pnggoR0i1309R1R14R3y30:__ASSET__assets_images_bot_pngR5y25:assets%2Fimages%2Fbot.pnggoR0i600R1R14R3y36:__ASSET__assets_images_img_tiles_pngR5y31:assets%2Fimages%2Fimg_tiles.pnggoR0i162R1R14R3y35:__ASSET__assets_images_dirt_top_pngR5y30:assets%2Fimages%2Fdirt_top.pnggoR0i169R1R14R3y36:__ASSET__assets_images_miniframe_pngR5y31:assets%2Fimages%2Fminiframe.pnggoR0i193R1R14R3y31:__ASSET__assets_images_dirt_pngR5y26:assets%2Fimages%2Fdirt.pnggoR0i114972R1y4:TEXTR3y30:__ASSET__assets_data_demo1_fgrR5y25:assets%2Fdata%2Fdemo1.fgrgoR0i72188R1R47R3y30:__ASSET__assets_data_demo2_fgrR5y25:assets%2Fdata%2Fdemo2.fgrgoR0i2532R1R2R3y36:__ASSET__assets_sounds_countdown_mp3R5y31:assets%2Fsounds%2Fcountdown.mp3goR0i5040R1R2R3y30:__ASSET__assets_sounds_hit_mp3R5y25:assets%2Fsounds%2Fhit.mp3goR0i20923R1R2R3y35:__ASSET__assets_sounds_menu_hit_mp3R5y30:assets%2Fsounds%2Fmenu_hit.mp3goR0i2114R1R2R3y31:__ASSET__assets_sounds_jump_mp3R5y26:assets%2Fsounds%2Fjump.mp3goR0i2114R1R2R3y33:__ASSET__assets_sounds_button_mp3R5y28:assets%2Fsounds%2Fbutton.mp3goR0i6659R1R2R3y32:__ASSET__assets_sounds_enemy_mp3R5y27:assets%2Fsounds%2Fenemy.mp3goR0i2533R1R2R3y30:__ASSET__assets_sounds_jam_mp3R5y25:assets%2Fsounds%2Fjam.mp3goR0i2114R1R2R3y32:__ASSET__assets_sounds_shoot_mp3R5y27:assets%2Fsounds%2Fshoot.mp3goR0i139597R1R2R3y31:__ASSET__assets_sounds_mode_mp3R5y26:assets%2Fsounds%2Fmode.mp3goR0i4204R1R2R3y31:__ASSET__assets_sounds_hurt_mp3R5y26:assets%2Fsounds%2Fhurt.mp3goR0i7966R1R2R3y34:__ASSET__assets_sounds_asplode_mp3R5y29:assets%2Fsounds%2Fasplode.mp3goR0i7130R1R2R3y30:__ASSET__assets_sounds_jet_mp3R5y25:assets%2Fsounds%2Fjet.mp3goR0i19251R1R2R3y37:__ASSET__assets_sounds_menu_hit_2_mp3R5y32:assets%2Fsounds%2Fmenu_hit_2.mp3gh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
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

@:keep @:bind #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends flash.text.Font { }
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
@:keep @:bind #if display private #end class __ASSET__assets_data_demo1_fgr extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_demo2_fgr extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_countdown_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_hit_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_menu_hit_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_jump_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_button_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_enemy_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_jam_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_shoot_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_mode_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_hurt_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_asplode_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_jet_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_menu_hit_2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__manifest_default_json extends flash.utils.ByteArray { }


#elseif (desktop || cpp)

@:keep @:file("/home/aluno-uffs/haxelib/flixel/4,6,0/assets/sounds/flixel.mp3") #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends haxe.io.Bytes {}
@:keep @:file("/home/aluno-uffs/haxelib/flixel/4,6,0/assets/sounds/beep.mp3") #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends haxe.io.Bytes {}
@:keep @:font("/home/aluno-uffs/haxelib/flixel/4,6,0/assets/fonts/nokiafc22.ttf") #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:keep @:font("/home/aluno-uffs/haxelib/flixel/4,6,0/assets/fonts/monsterrat.ttf") #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
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
@:keep @:file("") #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else

@:keep @:expose('__ASSET__flixel_fonts_nokiafc22_ttf') #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/nokiafc22.ttf"; #else ascender = null; descender = null; height = null; numGlyphs = null; underlinePosition = null; underlineThickness = null; unitsPerEM = null; #end name = "Nokia Cellphone FC Small"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_monsterrat_ttf') #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/monsterrat.ttf"; #else ascender = null; descender = null; height = null; numGlyphs = null; underlinePosition = null; underlineThickness = null; unitsPerEM = null; #end name = "Monsterrat"; super (); }}


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
