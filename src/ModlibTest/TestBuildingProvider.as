package ModlibTest 
{
	import com.giab.games.gcfw.ingame.IngameRenderer2;
	import flash.display.DisplayObject;
	
	/**
	 * ...
	 * @author Shy
	 */
	public class TestBuildingProvider 
	{
		public function TestBuildingProvider(building: Object) 
		{
		}
		
		public function mc(building: Object): DisplayObject
		{
			IngameRenderer2.mcTower.spf.visible = false;
			IngameRenderer2.mcTower.moss.alpha = 0;
			IngameRenderer2.mcTower.moss.filters = [];
			IngameRenderer2.mcTower.snow.alpha = 0;
			
			return IngameRenderer2.mcTower;
		}
		
		public function mcShadow(building: Object): DisplayObject
		{
			IngameRenderer2.mcBuildingShadow.gotoAndStop(1);
			
			return IngameRenderer2.mcBuildingShadow;
		}
		
		public function damageMultiplier(enhancement: int): Number { return 1; }
		public function specialMultiplier(enhancement: int): Number { return 1; }
		public function rangeMultiplier(enhancement: int): Number { return 1; }
		public function firingSpeedMultiplier(enhancement: int): Number { return 1; }
		public function minimumRange(enhancement: int): Number { return 0; }
		public function maximumRange(enhancement: int): Number { return 1e300; }
		public function maximumTargets(enhancement: int): Number { return 2; }
		public function timeBetweenTargetChecks(enhancement: int): Number { return 1; }
		public function killingShotDelay(enhancement: int): uint { return 15; }
		public function isRawDamage(enhancement: int): Boolean { return false; }
		public function doesEnhancementDisableNormal(enhancement: int): Boolean { return false; }
		public function enhancementAmmoUsage(enhancement: int): Number { return 1; }
		public function projectile(enhancement: int): Object { return TestProjectileProvider; }
	}
}