class Minesweeper {
  List<String> annoted = [];
  Map<String, int> cur = {"curString": 0, "curChar": 0};
  List<int> temp = [0, 0];
  final Set<List<int>> neighbors = {[0,1], [0,-1], [1,0],
                                    [-1,0], [-1,-1], [-1,1],
                                    [1,1], [1,-1]};
  int length = 0;
  int stringLength = 0;

  Minesweeper(List<String> table){
    annoted = table;
    length = table.length;
    if(annoted.length > 0){
      stringLength = table[0].length;
      Minesweep();
    }
  }

  List<String> Minesweep(){
    annoted.forEach((element) {
      for(int i = 0; i < stringLength; i++){
        if(element[i] == '*'){
          IncrementNeighbors();
        }
        cur.update("curChar", (value) => value + 1);
      }
      cur.update("curChar", (value) => 0);
      cur.update("curString", (value) => value + 1);
    });
    return annoted;
  }

  void IncrementNeighbors(){
    String val = '1';
    neighbors.forEach((element) {
      temp[0] = cur["curString"] !+ element[0];
      temp[1] = cur["curChar"] !+ element[1];
      if(temp[1] >= 0 && temp[0] >= 0 && temp[1] < stringLength && temp[0] < length && annoted[temp[0]][temp[1]] != '*'){
        if(annoted[temp[0]][temp[1]] != " "){
          val = (int.parse(annoted[temp[0]][temp[1]]) + 1).toString();
        }
        annoted[temp[0]] = annoted[temp[0]].substring(0, temp[1]) + val + annoted[temp[0]].substring(temp[1] + 1);
      }
      val = '1';
    });
  }
}
