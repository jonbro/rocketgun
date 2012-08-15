	package  
{
	/**
	 * Level Registry
	 */

	public class LevelsRegistry 
	{
		//	Levels
		[Embed(source = 'data/levels/2Player.oel', mimeType = 'application/octet-stream')] public static var 2Player:Class;
		[Embed(source = 'data/levels/Level1.oel', mimeType = 'application/octet-stream')] public static var Level1:Class;
		[Embed(source = 'data/levels/Level10.oel', mimeType = 'application/octet-stream')] public static var Level10:Class;
		[Embed(source = 'data/levels/Level11.oel', mimeType = 'application/octet-stream')] public static var Level11:Class;
		[Embed(source = 'data/levels/Level12.oel', mimeType = 'application/octet-stream')] public static var Level12:Class;
		[Embed(source = 'data/levels/Level13.oel', mimeType = 'application/octet-stream')] public static var Level13:Class;
		[Embed(source = 'data/levels/Level14.oel', mimeType = 'application/octet-stream')] public static var Level14:Class;
		[Embed(source = 'data/levels/Level15.oel', mimeType = 'application/octet-stream')] public static var Level15:Class;
		[Embed(source = 'data/levels/Level1_2.oel', mimeType = 'application/octet-stream')] public static var Level1_2:Class;
		[Embed(source = 'data/levels/Level1_3.oel', mimeType = 'application/octet-stream')] public static var Level1_3:Class;
		[Embed(source = 'data/levels/Level2.oel', mimeType = 'application/octet-stream')] public static var Level2:Class;
		[Embed(source = 'data/levels/Level3.oel', mimeType = 'application/octet-stream')] public static var Level3:Class;
		[Embed(source = 'data/levels/Level4.oel', mimeType = 'application/octet-stream')] public static var Level4:Class;
		[Embed(source = 'data/levels/Level5.oel', mimeType = 'application/octet-stream')] public static var Level5:Class;
		[Embed(source = 'data/levels/Level6.oel', mimeType = 'application/octet-stream')] public static var Level6:Class;
		[Embed(source = 'data/levels/Level7.oel', mimeType = 'application/octet-stream')] public static var Level7:Class;
		[Embed(source = 'data/levels/Level8.oel', mimeType = 'application/octet-stream')] public static var Level8:Class;
		[Embed(source = 'data/levels/Level9.oel', mimeType = 'application/octet-stream')] public static var Level9:Class;
		[Embed(source = 'data/levels/level_screen.oel', mimeType = 'application/octet-stream')] public static var level_screen:Class;
		[Embed(source = 'data/levels/lose_screen.oel', mimeType = 'application/octet-stream')] public static var lose_screen:Class;
		[Embed(source = 'data/levels/overlaytest.oel', mimeType = 'application/octet-stream')] public static var overlaytest:Class;
		[Embed(source = 'data/levels/title_screen.oel', mimeType = 'application/octet-stream')] public static var title_screen:Class;
		[Embed(source = 'data/levels/win_screen.oel', mimeType = 'application/octet-stream')] public static var win_screen:Class;
		public function AssetsRegistry() 
		{
		}
		public static function GetLevels():Object{
			return {'2Player':2Player,'Level1':Level1,'Level10':Level10,'Level11':Level11,'Level12':Level12,'Level13':Level13,'Level14':Level14,'Level15':Level15,'Level1_2':Level1_2,'Level1_3':Level1_3,'Level2':Level2,'Level3':Level3,'Level4':Level4,'Level5':Level5,'Level6':Level6,'Level7':Level7,'Level8':Level8,'Level9':Level9,'level_screen':level_screen,'lose_screen':lose_screen,'overlaytest':overlaytest,'title_screen':title_screen,'win_screen':win_screen,			};
		}
	}

}