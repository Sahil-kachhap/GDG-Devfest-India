class Respone<T>{
  Status status;
  T data;
  String message;

  Respone.loading(this.message):status=Status.LOADING;
  Respone.completed(this.data):status=Status.COMPLETED;
  Respone.error(this.message):status=Status.ERROR;

  @override
  String toString() {
    // TODO: implement toString
    return "Status: $status \n Message:$message \n Data:$data";
  }
}

enum Status{LOADING,COMPLETED,ERROR}