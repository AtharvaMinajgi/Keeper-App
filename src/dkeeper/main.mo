import List "mo:base/List";
import Debug "mo:base/Debug";

actor Dkeeper{

    //declearing the Note variable
    public type Note = {
        title: Text;
        content: Text;
    };
    
    //notes = List type 
    //List is type of Note, and List is empty hence nil

    //stable for permenant storage
    stable var notes: List.List<Note> = List.nil<Note>();

    //fetch data 
    public func createNote(titleText: Text, contentText: Text){

        let newNote: Note = {
            title = titleText;
            content = contentText;
        };

        //pushing the value into the notesList
        notes := List.push(newNote, notes);
        Debug.print(debug_show(notes));
    };

    //display data
    //query is used when data is to be read
    //here we use query function which rads the data and return is in form of array
    public query func readNotes(): async [Note]{
        return List.toArray(notes);
    };

    //delete data 
    //id used for deleting data at particular index
    //it will automaticlly be triggered after clicking delete button of the note
    public func deleteNote(id: Nat){
        
        //taking id-1 items from list
        let noteFront = List.take(notes, id);

        //dropping the elements till id to get the remaining elements from the list
        let noteBack = List.drop(notes, id + 1);

        //appending both noteFront and backNote
        notes := List.append(noteFront, noteBack);
    };
}