<Query Kind="Statements" />

var active = new StreamReader(@"C:\Users\Cyrus\Downloads\active.csv");
var inactive = new StreamReader(@"C:\Users\Cyrus\Downloads\inactive.csv"); 

var train = new StreamWriter(@"C:\Users\Cyrus\Downloads\data_train.txt");
var test = new StreamWriter(@"C:\Users\Cyrus\Downloads\data_test.txt");

string line = null;
int cnt = 0;
while ((line = active.ReadLine()) != null)
{
	if(cnt < 160000)
		train.WriteLine(line);
	else
		test.WriteLine(line);
		
	++ cnt;
}

cnt = 0;
while ((line = inactive.ReadLine()) != null)
{
	if (cnt < 160000)
		train.WriteLine(line);
	else
		test.WriteLine(line);
	++cnt;
}

active.Close();
inactive.Close();
train.Close();
test.Close();