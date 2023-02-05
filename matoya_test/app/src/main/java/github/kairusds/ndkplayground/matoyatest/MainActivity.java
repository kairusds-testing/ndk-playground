package github.kairusds.ndkplayground.matoyatest;

import android.os.Bundle;
import androidx.appcompat.app.AppCompatActivity;
import group.matoya.lib.Matoya;

public class MainActivity extends AppCompatActivity{

	static{
		System.loadLibrary("matoya-test");
	}

	@Override
	protected void onCreate(Bundle savedInstanceState){
		super.onCreate(savedInstanceState);
		new Matoya(this);
	}

}
