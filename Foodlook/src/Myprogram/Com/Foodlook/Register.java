package Myprogram.Com.Foodlook;

import android.app.Activity;
import android.content.ContentValues;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class Register extends Activity {
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		// TODO Auto-generated method stub
		super.onCreate(savedInstanceState);
		setContentView(R.layout.register);
		final Button button_reg=(Button)findViewById(R.id.Button_reg);
		final EditText edittext_reg_name=(EditText)findViewById(R.id.EditText_username_reg);
		final EditText edittext_reg_password=(EditText)findViewById(R.id.EditText_password_reg);
		final EditText edittext_reg_password_sure=(EditText)findViewById(R.id.EditText_password_ensure);
		
		button_reg.setOnClickListener(new OnClickListener() {
			
			public void onClick(View v) {
				// TODO Auto-generated method stub
				button_reg.setClickable(true);
				if(edittext_reg_password.getText().toString().equalsIgnoreCase(edittext_reg_password_sure.getText().toString()))
				{
					ContentValues values=new ContentValues();
					values.put("name", edittext_reg_name.getText().toString());
					values.put("password", edittext_reg_password.getText().toString());					
					Foodlook.Userdb.insert("User", null, values);
					button_reg.setClickable(false);
					Toast.makeText(getApplicationContext(), "注册成功！", Toast.LENGTH_SHORT).show();
					Intent intent=new Intent(Register.this,Foodlook.class);
					startActivity(intent);
				
				}
				else
				{
					Toast.makeText(getApplicationContext(), "输入密码有误！", Toast.LENGTH_SHORT).show();
				}
			}
		});
		
	}

}
