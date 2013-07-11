package Myprogram.Com.Foodlook;

import java.io.IOException;
import java.io.OutputStream;
import java.net.Socket;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.HashMap;
import android.widget.AdapterView.OnItemLongClickListener;
import android.app.Activity;
import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.database.Cursor;
import android.os.Bundle;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnTouchListener;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.ListView;
import android.widget.SimpleAdapter;
import android.widget.TextView;
import android.widget.Toast;

public class Mylist extends Activity{
	int i=0;
	int MODE=1;
	String username=null;
	static int flag_net=1;//向服务器发送数据会发送2次所以现在就加一个标志位，防止发送2次数据

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		// TODO Auto-generated method stub
		super.onCreate(savedInstanceState);
		setContentView(R.layout.mylist);
		 HashMap[] mapofmylist = new HashMap[100];
			final String [] usernama_s=new String[100];
			final String [] name_s = new String[100];
			final String [] cost_s = new String[100];
		 Bundle togetdata=getIntent().getExtras();
		 username=togetdata.getString("username");
		 TextView textview_username_item=(TextView)findViewById(R.id.Username);
		 textview_username_item.setText(username);
		 ListView listofmylist=(ListView)findViewById(R.id.Mylist);
		 final Builder builder_remove=new AlertDialog.Builder(this);
		 
		 
		 ArrayList<HashMap<String,Object>> listviewofmylist=new ArrayList<HashMap<String, Object>>();
		 Cursor cursor_mylist=Foodlook.Userdb.query("Mylist", new String[]{"username","name","cost"}, null, null, null, null, null);
	        while(cursor_mylist.moveToNext())
	        {
				String usernames=cursor_mylist.getString(cursor_mylist.getColumnIndex("username"));
				String name=cursor_mylist.getString(cursor_mylist.getColumnIndex("name"));
				String cost=cursor_mylist.getString(cursor_mylist.getColumnIndex("cost"));
				
			    usernama_s[i]=new String();
			    name_s[i]=new String();
			    cost_s[i]=new String();
			    usernama_s[i]=usernames;
			    name_s[i]=name;
			    cost_s[i]=cost;
				
	        	mapofmylist[i]=new HashMap<String,Object>();
	        	mapofmylist[i].put("username",usernames);
	        	mapofmylist[i].put("name",name);
	        	mapofmylist[i].put("cost", cost);
			    listviewofmylist.add(mapofmylist[i]);

			    
			    i++;
	        }
	        SimpleAdapter simpleAdapterofmylist=new SimpleAdapter(this, listviewofmylist,R.layout.listofmylist, new String[]{"username","name","cost"},new int[]{R.id.TextView_username_list,R.id.TextView_name,R.id.TextView_money} );
	        //menu实现listview
	        listofmylist.setAdapter(simpleAdapterofmylist);
	        //mylist 实现diag的弹出窗口
	        listofmylist.setOnItemLongClickListener(new OnItemLongClickListener() {

				public boolean onItemLongClick(final AdapterView<?> father, View arg1,
						final int position, long arg3) {
					// TODO Auto-generated method stub
					builder_remove.setTitle("注意");
					builder_remove.setMessage("删除当前项");
					builder_remove.setIcon(R.drawable.icon);
					builder_remove.setPositiveButton("确定", new OnClickListener() {
						
						public void onClick(DialogInterface dialog, int which) {
							// TODO Auto-generated method stub	MYLIST删除操作
							ListView listview_mlist_temp = (ListView)father;
							HashMap<String, Object> map_ML_temp=(HashMap<String, Object>)listview_mlist_temp.getItemAtPosition(position);
							String Key_temp_database_remove=(String)map_ML_temp.get("name");
							//Toast.makeText(getApplicationContext(), (String) map_ML_temp.get("name"), Toast.LENGTH_SHORT).show();
							Foodlook.Userdb.delete("Mylist","name like ?",new String[]{Key_temp_database_remove});
							Intent intent_Mylist = new Intent(Mylist.this, Mylist.class);
							flag_net=1;
							intent_Mylist.putExtra("username", username);
							startActivity(intent_Mylist);
						}
					});
					builder_remove.setNegativeButton("取消", new OnClickListener() {
						
						public void onClick(DialogInterface dialog, int which) {
							// TODO Auto-generated method stub
							
						}
					});
					builder_remove.create().show();

					return false;
				}
			});
	        

	     //button 向服务器发送请求发送请求
	        Button button_send=(Button)findViewById(R.id.Button_send);
	       button_send.setOnTouchListener(new OnTouchListener() {
							
				public boolean onTouch(View v, MotionEvent event) {
					// TODO Auto-generated method stub
//					to send to network
					if (MODE==1)
					{
						if(flag_net==1)
						{
						
//						send by massages
						for(int l=0;l<usernama_s.length-1;l++)
						{
							if(usernama_s[l]==null)
							{
								break;
							}
							else
							{
							String temp_list_data=usernama_s[l]+"------"+name_s[l]+"--------"+cost_s[l];
							
//							the code of to send massages
							  try {
								  	Socket soctet = new Socket("192.168.1.104",54321);
//									BufferedReader br = new BufferedReader(new InputStreamReader(soctet.getInputStream()));
//									String line = br.readLine();
//									show.setText("来自服务器的信息"+line);
//									br.close();
									OutputStream os= soctet.getOutputStream();
									os.write(temp_list_data.getBytes("GB2312"));
									os.close();
									soctet.close();
									Toast.makeText(getApplicationContext(), "已经向服务器发送订单",Toast.LENGTH_SHORT).show();
									//Toast.makeText(getApplicationContext(),l+"", Toast.LENGTH_SHORT).show();
								  }
						    catch (UnknownHostException e) 
						    	{
									// TODO Auto-generated catch block
									e.printStackTrace();
						    	} 
						    catch (IOException e) 
						    	{
									// TODO Auto-generated catch block
									e.printStackTrace();
						    	}
							}
						}
						flag_net=0;
						}
					}
					else if(MODE==0)
					{
//						send by network
						Toast.makeText(getApplicationContext(), "已经向服务器发送订单",Toast.LENGTH_SHORT).show();
					}
					else
					{
//						print the error of send
					}
					return false;
				}


			});
			
	}
	@Override
	protected void onDestroy() {
		// TODO Auto-generated method stub
		super.onDestroy();
		flag_net=1;
	}
}
