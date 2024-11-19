module tb;

  task first();
    $display("Task 1 started at %0t", $time);
    #20;
    $display("Task 1 Copmleted at %0t", $time);
  endtask


  task second();
    $display("Task 2 started at %0t", $time);
    #30;
    $display("Task 2 Copmleted at %0t", $time);
  endtask

  task third();
    $display("Reached next to join at %0t", $time);
  endtask


  initial begin
    
   fork
     first();
     second();

   join_any // if any of the processes first or secend gets executed then third will get executed
// Eventhoug my task2 is not completed we are allowed to go to third
    
    third();
  end


endmodule
