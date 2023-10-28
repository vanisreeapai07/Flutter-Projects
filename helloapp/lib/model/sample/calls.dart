class Calls {
  String name;
  String date;
  String time;
  String madeBy;
  String status;
  String source;
  String imageURL;
  Calls({
    required this.name,
    required this.date,
    required this.status,
    required this.time,
    required this.madeBy,
    required this.source,
    required this.imageURL,
  });
}

List<Calls> callContent = [
  Calls(
      name: "Jane Russel",
      date: 'january 29',
      time: '22:12',
      madeBy: "currentUser",
      status: 'completed',
      source: 'call',
      imageURL:
          "https://images.unsplash.com/photo-1687360440491-702812c5728c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2400&q=80"),
  Calls(
      name: "Glady's Murphy",
      date: 'january 29',
      time: '22:12',
      madeBy: "sender",
      status: 'completed',
      source: 'call',
      imageURL:
          "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2787&q=80"),
  Calls(
      name: "Jorge Henry",
      date: 'january 29',
      time: '22:12',
      madeBy: "currentUser",
      status: 'failed',
      source: 'call',
      imageURL:
          "https://images.unsplash.com/photo-1531746020798-e6953c6e8e04?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1064&q=80"),
  Calls(
      name: "Philip Fox",
      date: 'january 29',
      time: '22:12',
      madeBy: "currentUser",
      status: 'failed',
      source: 'call',
      imageURL:
          "https://images.unsplash.com/photo-1552374196-c4e7ffc6e126?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2787&q=80"),
  Calls(
      name: "Debra Hawkins",
      date: 'january 29',
      time: '22:12',
      madeBy: "sender",
      status: 'failed',
      source: 'call',
      imageURL:
          "https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=776&q=80"),
  Calls(
      name: "Jacob Pena",
      date: 'january 29',
      time: '22:12',
      madeBy: "currentUser",
      status: 'completed',
      source: 'videoCall',
      imageURL:
          "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"),
  Calls(
      name: "Andrey Jones",
      date: 'january 29',
      time: '22:12',
      madeBy: "sender",
      status: 'failed',
      source: 'call',
      imageURL:
          "https://images.unsplash.com/photo-1504257432389-52343af06ae3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"),
];
