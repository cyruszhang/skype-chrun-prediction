<Query Kind="Statements" />

var train = new StreamReader(@"C:\Users\Cyrus\Downloads\data_train.txt");
var test = new StreamReader(@"C:\Users\Cyrus\Downloads\data_test.txt");

var trainX = new StreamWriter(@"C:\Users\Cyrus\Downloads\data_trainX.csv");
var trainy = new StreamWriter(@"C:\Users\Cyrus\Downloads\data_trainy.csv");

var testX = new StreamWriter(@"C:\Users\Cyrus\Downloads\data_testX.csv");
var testy = new StreamWriter(@"C:\Users\Cyrus\Downloads\data_testy.csv");

string line = null;
while ((line = train.ReadLine()) != null)
{
	if(line.StartsWith("|labels 0 1 |features "))
		trainy.WriteLine("1");
	else 
		trainy.WriteLine("0");
	
	trainX.WriteLine(line.Substring(22).Replace(' ', ','));
}

trainy.Close();
trainX.Close();


while ((line = test.ReadLine()) != null)
{
	if (line.StartsWith("|labels 0 1 |features "))
		testy.WriteLine("1");
	else
		testy.WriteLine("0");

	testX.WriteLine(line.Substring(22).Replace(' ', ','));
}

testy.Close();
testX.Close();
