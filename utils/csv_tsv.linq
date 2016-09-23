<Query Kind="Statements" />

var fin = new StreamReader(@"C:\Users\Cyrus\Downloads\activeUser_1p.tsv");
var fout = new StreamWriter(@"C:\Users\Cyrus\Downloads\activeUser_1p.csv");
//var fin = new StreamReader(@"C:\Users\Cyrus\Downloads\inactiveUser_1p.tsv");
//var fout = new StreamWriter(@"C:\Users\Cyrus\Downloads\inactiveUser_1p.csv");

string line = null;
int i = 0;
while ((line = fin.ReadLine()) != null)
{
	if (++i > 1000000)
		break;
	fout.WriteLine(line.Replace('\t', ','));
}

fin.Close();
fout.Close();