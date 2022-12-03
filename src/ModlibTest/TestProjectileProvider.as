package ModlibTest 
{
	import com.giab.common.utils.ColorToolbox;
	import com.giab.games.gcfw.GV;
	import com.giab.games.gcfw.mcDyn.McTowerShot;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Shy
	 */
	public class TestProjectileProvider 
	{
		private static const MAX_AGE: Number = 75;
		
		private var age: Number;
		private var originalDistanceX: Number;
		private var originalDistanceY: Number;
		
		public function TestProjectileProvider(projectile: Object) 
		{
			age = 0;
			originalDistanceX = (projectile.building.x + 50) - (projectile.target.x + projectile.targetOffsetX)
			originalDistanceY = (projectile.building.y + 8) - (projectile.target.y + projectile.targetOffsetY);
		}
		
		public function mc(projectile: Object): DisplayObject
		{
			var mc: MovieClip = new McTowerShot(); 
			mc.x = projectile.building.x + 50;
			mc.y = projectile.building.y + 8;
			var sizeBonus: Number = 0.08 * projectile.originGem.grade.g();
			if (sizeBonus > 0.8)
			{
				sizeBonus = 0.8;
			}
			mc.scaleX = mc.scaleY = 4 + 1.6 * sizeBonus;
			return mc;
		}
		
		public function update(projectile: Object, speedMultiplier: Number): Boolean
		{
			var xDiff: Number = (projectile.target.x + projectile.targetOffsetX) - projectile.mc.x;
			var yDiff: Number = (projectile.target.y + projectile.targetOffsetY) - projectile.mc.y;
			var distanceSquared: Number = xDiff * xDiff + yDiff * yDiff;
			
			if (distanceSquared < 36)
			{
				GV.vfxEngine.createShotImpact(projectile.mc.x, projectile.mc.y, projectile.rgb, projectile.ctr);
				return true;
			}
			
			age += speedMultiplier;
			if (age > MAX_AGE)
			{
				age = MAX_AGE;
			}
			
			projectile.mc.x += xDiff * age / MAX_AGE;
			projectile.mc.y += yDiff * age / MAX_AGE;
			projectile.mc.rotation = age * 10;
			
			if (age >= MAX_AGE)
			{
				GV.vfxEngine.createShotImpact(projectile.mc.x, projectile.mc.y, projectile.rgb, projectile.ctr);
				return true;
			}
			else
			{
				return false;
			}
		}
	}
}