package Myprogram.Com.Foodlook;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteDatabase.CursorFactory;
import android.database.sqlite.SQLiteOpenHelper;


public class DatebaseHelp extends SQLiteOpenHelper {
    public DatebaseHelp(Context context, String name, CursorFactory factory,
			int version) {
		super(context, name, factory, version);
		// TODO Auto-generated constructor stub
	}


	@Override
	public void onCreate(SQLiteDatabase db) {
		// TODO Auto-generated method stub
		db.execSQL("create table User(name varchar(20),password varchar(20))");
		db.execSQL("create table Today(pic int,name varchar(20),cost varchar(20))");
		db.execSQL("create table Menu(pic int,name varchar(20),cost varchar(20))");
		db.execSQL("create table Mylist(username varchar(20),name varchar(20),cost varchar(20))");

	}
	@Override
	public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
		// TODO Auto-generated method stub
		
	}

}