package db;
import sys.db.Object;
import sys.db.Types;

@:id(userId,amapId,year)
class Membership extends Object
{
	@:relation(amapId) 
	public var amap : Amap;
	#if neko
	public var amapId : SInt;
	#end
	
	@:relation(userId)
	public var user : db.User;
	#if neko
	public var userId : SInt;
	#end
	
	//année de cotisation (année la plus ancienne si a cheval sur deux années : 2014-2015  -> 2014)
	public var year : Int;
	public var date : SNull<SDate>;
	
	public static function get(user:User, amap:Amap,year:Int, ?lock = false) {
		return manager.select($user == user && $amap == amap && $year == year, lock);
	}	
	
	
	
}