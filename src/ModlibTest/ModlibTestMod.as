package ModlibTest
{
	import Bezel.Bezel;
	import Bezel.BezelMod;
	import Bezel.Logger;
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author Shy
	 */
	public class ModlibTestMod extends MovieClip implements BezelMod
	{
		private static const TEST_BUILDING_ID: String = "test building";
		
		public function get MOD_NAME(): String { return "Modlib Test Mod"; }
		public function get VERSION(): String { return "0.1.0"; }
		
		public function get BEZEL_VERSION(): String { return "2.0.6"; }
		
		public static var instance: ModlibTestMod;
		public var bezel: Bezel;
		public var logger: Logger;
		
		public function ModlibTestMod()
		{
		}
		
		public function bind(modLoader: Bezel, gameObjects: Object): void
		{
			bezel = modLoader;
			logger = bezel.getLogger(MOD_NAME);
			
			bezel.getModByName("Modlib").loaderInfo.applicationDomain.getDefinition("Modlib.Registry").registerBuilding(TestBuildingProvider, TEST_BUILDING_ID, 250, 50);
		}
		
		public function unload(): void
		{
		}
	}
}