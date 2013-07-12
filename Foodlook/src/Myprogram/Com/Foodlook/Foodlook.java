package Myprogram.Com.Foodlook;

import android.app.Activity;
import android.content.Intent;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class Foodlook extends Activity {
    /** Called when the activity is first created. */
	static SQLiteDatabase Userdb;
	String psw;
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);
        final EditText edit_name=(EditText)findViewById(R.id.EditText_username);
         final EditText edit_password=(EditText)findViewById(R.id.EditText_password);
        Button botton_log=(Button)findViewById(R.id.Button_log);
        Button botton_register=(Button)findViewById(R.id.Button_register);
        
        /*userdata create*/
        DatebaseHelp dbHelper =new DatebaseHelp(Foodlook.this, "Userdatabase", null, 1);
        Userdb= dbHelper.getWritableDatabase();
        /*end*/
        botton_log.setOnClickListener(new OnClickListener() {
			
			public void onClick(View v) {
				// TODO Auto-generated method stub
				Cursor cursor= Userdb.query("User", new String[]{"password"}, "name=?", new String[]{edit_name.getText().toString()}, null, null, null);
				while(cursor.moveToNext())
				{
					psw=cursor.getString(cursor.getColumnIndex("password"));
				}
				if(edit_password.getText().toString().equalsIgnoreCase(psw))
					{
						
						Intent intent=new Intent(Foodlook.this,Today.class);
						intent.putExtra("username", edit_name.getText().toString());
						startActivity(intent);
					}
				else
					{
						Toast.makeText(getApplicationContext(), "用户名或密码不正确！", Toast.LENGTH_SHORT).show();
					}
				}
			}
		);
        botton_register.setOnClickListener(new OnClickListener() {
			
			public void onClick(View v) {
				// TODO Auto-generated method stub
				Intent intent=new Intent(Foodlook.this,Register.class);
				startActivity(intent);
			}
		});

    }
    @Override
    protected void onDestroy() {
    	// TODO Auto-generated method stub
    	super.onDestroy();
    	Foodlook.Userdb.execSQL("delete from Menu");
    	Foodlook.Userdb.execSQL("delete from Today");
    	Foodlook.Userdb.execSQL("delete from Mylist");
    	}
}