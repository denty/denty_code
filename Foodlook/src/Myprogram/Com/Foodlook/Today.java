package Myprogram.Com.Foodlook;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.Socket;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.HashMap;
import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.app.TabActivity;
import android.content.ContentValues;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.DialogInterface.OnClickListener;
import android.database.Cursor;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnTouchListener;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.Button;
import android.widget.ListView;
import android.widget.SimpleAdapter;
import android.widget.TabHost;
import android.widget.TextView;

public class Today extends TabActivity{
    /** Called when the activity is first created. */
	static int Flag_of_tab=0;
	int i=0;
	int l=0;
	int Flag_of_Mylist=1;
	String username=null;
	static	String [][] soct_menu_get;
	static	String  soct_today_get;
    @Override
    public void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
		HashMap[] mapofmenu = new HashMap[100];
		HashMap[] mapoftoday =new HashMap[100];
        
        //tabhost实现界面
        final TabHost tablehost=getTabHost();
        LayoutInflater.from(this).inflate(R.layout.today,tablehost.getTabContentView(),true);
        LayoutInflater.from(this).inflate(R.layout.menu,tablehost.getTabContentView(),true);
        tablehost.addTab(tablehost.newTabSpec("TAB1").setIndicator("今日推荐").setContent(R.id.taboftoday));
        tablehost.addTab(tablehost.newTabSpec("TAB2").setIndicator("菜单").setContent(R.id.tabofmenu));
        tablehost.setCurrentTab(Flag_of_tab);//在使用设置当前table页的时候使用标志位记忆上一次画面
       // Foodlook.Userdb.insert("Menu", null, values);
//        获取用户名
		 Bundle togetdata=getIntent().getExtras();
		 username=togetdata.getString("username");
		 final TextView textview_username_item_menu=(TextView)findViewById(R.id.Username_menu);
		 textview_username_item_menu.setText(username);
		 TextView textview_username_item_today=(TextView)findViewById(R.id.Username_today);
		 textview_username_item_today.setText(username);
//        创建一个对话框
        final Builder askAdd_today= new AlertDialog.Builder(this);
        final Builder askAdd_menu= new AlertDialog.Builder(this);
        //LISTVIEW实现初始化
        ListView listoftoday=(ListView)findViewById(R.id.todaylist);
        ListView listofMenu=(ListView)findViewById(R.id.menulist);
        //today适配器
        ArrayList<HashMap<String,Object>> listviewoftoday=new ArrayList<HashMap<String, Object>>();
        //today查询数据
        Cursor cursor_today=Foodlook.Userdb.query("Today", new String[]{"pic","name","cost"}, null, null, null, null, null);
        while(cursor_today.moveToNext())
        {
			int pic=cursor_today.getInt(cursor_today.getColumnIndex("pic"));
			String name=cursor_today.getString(cursor_today.getColumnIndex("name"));
			String cost=cursor_today.getString(cursor_today.getColumnIndex("cost"));
			mapoftoday[l]=new HashMap<String,Object>();

        	mapoftoday[l].put("pic",pic);
        	mapoftoday[l].put("name",name);
        	mapoftoday[l].put("cost",cost );
		     listviewoftoday.add(mapoftoday[l]);
			 l++;
        }
        SimpleAdapter simpleAdapteroftoday=new SimpleAdapter(this, listviewoftoday,R.layout.list, new String[]{"pic","name","cost"},new int[]{R.id.ImageView01,R.id.TextView_name,R.id.TextView_money} );
        //today实现listview
        listoftoday.setAdapter(simpleAdapteroftoday);
        final Button button_updata_today=(Button)findViewById(R.id.Button_ofUpdata_today);
//        button_updata_today.setFocusableInTouchMode(true);
        button_updata_today.setOnTouchListener(new OnTouchListener() 
        {
        	
			
			public boolean onTouch(View v, MotionEvent motionEvent) 
			{
				//TabHost tabHost_Buttonoftoday;
				//String tabHost_Buttonoftodayindex;
				// TODO Auto-generated method stub
				if (MotionEvent.ACTION_DOWN==motionEvent.getAction())
				{
				//	flag_tab=0;
					try {
						Socket socket_today=new Socket("192.168.1.104", 65432);
						BufferedReader br = new BufferedReader(new InputStreamReader(socket_today.getInputStream()));
						String line = br.readLine();
						soct_today_get=line;
						br.close();
						socket_today.close();
					} catch (UnknownHostException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				insertToday_web();
				button_updata_today.setFocusableInTouchMode(false);
				Intent intent_today=new Intent(Today.this,Today.class);
				intent_today.putExtra("username", username);
				//tabHost_Buttonoftoday=getTabHost();
				//tabHost_Buttonoftodayindex="TAB1";
				//tablehost.setCurrentTab(tablehost.getCurrentTab());
				setFlagofTab(0);
				startActivity(intent_today);
//add by sunshqi___________________________________________________________________refresh activity			
				
				return true;
				}
				else
				{
				return false;
				}
			} 
		});
        /*list view 的 item 选定监听（today 模块）*/
        listoftoday.setOnItemClickListener(new OnItemClickListener() 
        {

			public void onItemClick(final AdapterView<?> father_today, View arg1, final int position,long id)
			{
				// TODO Auto-generated method stub
				askAdd_today.setIcon(R.drawable.icon);
				askAdd_today.setTitle("添加");
				askAdd_today.setMessage("添加到我的菜单");
				askAdd_today.setPositiveButton("确定", new OnClickListener()
				{
					
					public void onClick(DialogInterface dialog, int which)
					{
						// TODO Auto-generated method stub
						Flag_of_Mylist=1;
						if(Flag_of_Mylist==1)
						{	
							ListView listView = (ListView)father_today;
							HashMap<String, Object> map = (HashMap<String, Object>) listView.getItemAtPosition(position);
							String name = (String) map.get("name");
							String cost = (String) map.get("cost");
				    		ContentValues values=new ContentValues();
							values.put("username", username);
							values.put("name", name);	
							values.put("cost",cost);
							Foodlook.Userdb.insert("Mylist", null, values);
							Flag_of_Mylist=0;
						}
					}
					
				});
				askAdd_today.setNegativeButton("取消", new OnClickListener() {
					
					public void onClick(DialogInterface dialog, int which) {
						// TODO Auto-generated method stub
						
					}
				});
			
				askAdd_today.create().show();
//					start add my_list

			}

				
        });
        //menu适配器        
        ArrayList<HashMap<String, Object>> listviewofmenu = new ArrayList<HashMap<String,Object>>();
        //menu查询数据
        Cursor cursor= Foodlook.Userdb.query("Menu", new String[]{"pic","name","cost"}, null, null, null, null, null);
		while(cursor.moveToNext())
		{
			int pic=cursor.getInt(cursor.getColumnIndex("pic"));
			String name=cursor.getString(cursor.getColumnIndex("name"));
			String cost=cursor.getString(cursor.getColumnIndex("cost"));
        	mapofmenu[i]=new HashMap<String,Object>();

			 mapofmenu[i].put("pic",pic);
			 mapofmenu[i].put("name",name);
			 mapofmenu[i].put("cost",cost );
		     listviewofmenu.add(mapofmenu[i]);
			 i++;
		}
        SimpleAdapter simpleAdapterofmenu=new SimpleAdapter(this, listviewofmenu,R.layout.list, new String[]{"pic","name","cost"},new int[]{R.id.ImageView01,R.id.TextView_name,R.id.TextView_money} );
        //menu实现listview
        listofMenu.setAdapter(simpleAdapterofmenu);
        //updata
        final Button button_updata_Menu=(Button)findViewById(R.id.Button_ofUpdata);
        button_updata_Menu.setFocusableInTouchMode(true);
        button_updata_Menu.setOnTouchListener(new OnTouchListener() 
        {
        	
			
			public boolean onTouch(View v, MotionEvent motionEvent) 
			{
				// TODO Auto-generated method stub
				if(MotionEvent.ACTION_DOWN==motionEvent.getAction())
				{
				//	flag_tab=1;
					insertMenu();
					button_updata_Menu.setFocusableInTouchMode(false);
					tablehost.setCurrentTab(1);///////////////////////////////////////////add by solution the tab scream
					Intent intent_menu=new Intent(Today.this,Today.class);
					intent_menu.putExtra("username", username);
					//Toast.makeText(getApplication(), "is"+tablehost.getCurrentTab()+tablehost.getCurrentTabTag(),Toast.LENGTH_SHORT).show();
					setFlagofTab(1);
					startActivity(intent_menu);
//add bu sunshiqi _________________________________________________________________to refresh the activity	
					//onResume();
					

					return true;
				}
				else
				{
					return false;
				}

			} 
		});
        /*list view 选定模块的监听设置（Menu模块）*/
        listofMenu.setOnItemClickListener(new OnItemClickListener() 
        {

			public void onItemClick(final AdapterView<?> father, View arg1, final int position,long id)
			{
				// TODO Auto-generated method stub
				askAdd_menu.setIcon(R.drawable.icon);
				askAdd_menu.setTitle("添加");
				askAdd_menu.setMessage("添加到我的菜单");
				askAdd_menu.setPositiveButton("确定", new OnClickListener()
				{
					
					public void onClick(DialogInterface dialog, int which)
					{
						// TODO Auto-generated method stub
						Flag_of_Mylist=1;
						if(Flag_of_Mylist==1)
						{	
							ListView listView = (ListView)father;
							HashMap<String, Object> map = (HashMap<String, Object>) listView.getItemAtPosition(position);
							String name = (String) map.get("name");
							String cost = (String) map.get("cost");
				    		ContentValues values=new ContentValues();
							values.put("username", username);
							values.put("name", name);	
							values.put("cost",cost);
							Foodlook.Userdb.insert("Mylist", null, values);
							Flag_of_Mylist=0;
						}
						
					}
					
				});
				askAdd_menu.setNegativeButton("取消", new OnClickListener() {
					
					public void onClick(DialogInterface dialog, int which) {
						// TODO Auto-generated method stub
						Flag_of_Mylist=0;
					}
				});
			
				askAdd_menu.create().show();
//					start add my_list

			}

				
        });
 /*z*/
        Button button_info_Mylist=(Button)findViewById(R.id.Button_info_mylist);
        button_info_Mylist.setOnTouchListener(new OnTouchListener() {
			
			public boolean onTouch(View v, MotionEvent event) {
				// TODO Auto-generated method stub
				if (MotionEvent.ACTION_DOWN==event.getAction()) 
				{
					Intent intent=new Intent(Today.this,Mylist.class);
					intent.putExtra("username", username);
					startActivity(intent);
					return true;
					
				} else 
				{
					return false;
				}
				
			}
		});
	
    }

// refreash about data able to link the network
    static	public void insertMenu()
    	{
    		
    		ContentValues values=new ContentValues();
//			01
			values.put("pic", R.drawable.foodpic02);
			values.put("name", "紫菜包饭");	
			values.put("cost","12元");
			Foodlook.Userdb.insert("Menu", null, values);
//			02
			values.put("pic", R.drawable.foodpic03);
			values.put("name", "狗不理包子");	
			values.put("cost","12元");
			Foodlook.Userdb.insert("Menu", null, values);
//			03
			values.put("pic", R.drawable.foodpic04);
			values.put("name", "锅贴");	
			values.put("cost","4元");
			Foodlook.Userdb.insert("Menu", null, values);
//			04
			values.put("pic", R.drawable.foodpic05);
			values.put("name", "披萨");	
			values.put("cost","11元");
			Foodlook.Userdb.insert("Menu", null, values);
//			05
			values.put("pic", R.drawable.foodpic06);
			values.put("name", "扬州炒饭");	
			values.put("cost","15元");
			Foodlook.Userdb.insert("Menu", null, values);
//			06
			values.put("pic", R.drawable.foodpic07);
			values.put("name", "嫩牛五方");	
			values.put("cost","13元");
			Foodlook.Userdb.insert("Menu", null, values);
//			07
			values.put("pic", R.drawable.foodpic08);
			values.put("name", "阳春面");	
			values.put("cost","10元");
			Foodlook.Userdb.insert("Menu", null, values);
//			08
    	}
//    ****************************************************************************
//    static 	public void insertMenu_web()
//    //此处是进行web方式进行获取后的数据的存储
//    //在此之前先要把socket中得到的数据规范的放入到soct_menu_get这个二维数组中，然后程序会根据代码中的安排，把数据存入menu这个数据库中
//   //关键点在于，在更新按钮按下之后要在监听器函数中进行数据的收集，而且关键是如何标准的存入到这个二维数组中
//    {
//    	ContentValues contentvalues_Menu_web=new ContentValues();
//    	for(int temp=0;temp<soct_menu_get.length;temp++)
//    	{
//    	contentvalues_Menu_web.put("pic",findpic(Integer.parseInt(soct_menu_get[temp][0])));
//    	contentvalues_Menu_web.put("name",soct_menu_get[temp][1]);	
//    	contentvalues_Menu_web.put("cost",soct_menu_get[temp][2]);
//		Foodlook.Userdb.insert("Menu", null, contentvalues_Menu_web);
//    	}
//    }
//    *************************************************************************************
    static 	public int findpic(int a)
    {
    	int temp_picid=0;
    	switch (a) {
		case 2:
			temp_picid=R.drawable.foodpic02;
			break;
		case 3:
			temp_picid=R.drawable.foodpic03;
			break;
		case 4:
			temp_picid=R.drawable.foodpic04;
			break;
		case 5:
			temp_picid=R.drawable.foodpic05;
			break;
		case 6:
			temp_picid=R.drawable.foodpic06;
			break;
		case 7:
			temp_picid=R.drawable.foodpic07;
			break;
		case 8:
			temp_picid=R.drawable.foodpic08;
			break;
		default:
			break;
		}
    	return temp_picid;
    }
//    static	public void insertToday()
//	{
//
//		ContentValues values=new ContentValues();
//		values.put("pic", R.drawable.foodpic02);
//		values.put("name", "紫菜包饭");	
//		values.put("cost","12元");
//		Foodlook.Userdb.insert("Today", null, values);
////		02
//		values.put("pic", R.drawable.foodpic03);
//		values.put("name", "狗不理包子");	
//		values.put("cost","12元");
//		Foodlook.Userdb.insert("Today", null, values);
////		03
//	}
//    ********************************************************************************************
    static public void insertToday_web()
    {
    	ContentValues contentvalues_Today_web=new ContentValues();
    	contentvalues_Today_web.put("pic",findpic(Integer.parseInt(soct_today_get)));
    	contentvalues_Today_web.put("name", findname(Integer.parseInt(soct_today_get)));	
    	contentvalues_Today_web.put("cost",findcost(Integer.parseInt(soct_today_get)));
    	Foodlook.Userdb.insert("Today", null, contentvalues_Today_web);
    }
//    **********************************************************************************************
    
    /*add by to judge the scream for tab*/
    static public String findname(int a)
    {
    	String name;
    	name=null;
    	switch(a)
    	{
    	case 2:
    		name="紫菜包饭";
    		break;
    	case 3:
    		name="狗不理包子";
    		break;
    	case 4:
    		name="锅贴";
    		break;
    	case 5:
    		name="比萨饼";
    		break;
    	case 6:
    		name="扬州炒饭";
    		break;
    	case 7:
    		name="三明治";
    		break;
    	case 8:
    		name="阳春面";
    		break;
    	default:
    			break;
    	}
    	return name;
    }
    static public String findcost(int a)
    {
    	String cost;
    	cost=null;
    	switch(a)
    	{
    	case 2:
    		cost="12元";
    		break;
    	case 3:
    		cost="12元";
    		break;
    	case 4:
    		cost="4元";
    		break;
    	case 5:
    		cost="11元";
    		break;
    	case 6:
    		cost="15元";
    		break;
    	case 7:
    		cost="13元";
    		break;
    	case 8:
    		cost="10元";
    		break;
    	default:
    			break;
    	}
    	return cost;
    }
public void setFlagofTab(int index)
{
	Flag_of_tab=index;
}
}
