# Bresenham Line and Circle Algorithms
# Draws Eiffel Tower

main:
   #addi   $a0, $0, 30
   #addi   $a1, $0, 100
   #addi   $a2, $0, 20
   #jal    Circle

   #Right Bottom Leg
   addi   $a0, $0, 180
   addi   $a1, $0, 20
   addi   $a2, $0, 140
   addi	  $a3, $0, 60
   jal    Line
   
   #Right Middle
   addi   $a0, $0, 140
   addi   $a1, $0, 60
   addi   $a2, $0, 120
   addi	  $a3, $0, 100
   jal    Line
   
   #Right Top
   addi   $a0, $0, 120
   addi   $a1, $0, 100
   addi   $a2, $0, 100
   addi	  $a3, $0, 200
   jal    Line

#LEFT****************************
   #Left Bottom Leg
   addi   $a0, $0, 20
   addi   $a1, $0, 20
   addi   $a2, $0, 60
   addi	  $a3, $0, 60
   jal    Line
   
   #Left Middle
   addi   $a0, $0, 60
   addi   $a1, $0, 60
   addi   $a2, $0, 80
   addi	  $a3, $0, 100
   jal    Line
   
   #Left Top
   addi   $a0, $0, 80
   addi   $a1, $0, 100
   addi   $a2, $0, 100
   addi	  $a3, $0, 200
   jal    Line
   
   #Top
   addi   $a0, $0, 100
   addi   $a1, $0, 200
   addi   $a2, $0, 100
   addi	  $a3, $0, 212
   jal    Line
   
   
   #Bottom Rail
   addi   $a0, $0, 60
   addi   $a1, $0, 60
   addi   $a2, $0, 100
   addi	  $a3, $0, 60
   jal    Line
   
   addi   $a0, $0, 60
   addi   $a1, $0, 64
   addi   $a2, $0, 100
   addi	  $a3, $0, 64
   jal    Line

   addi   $a0, $0, 100
   addi   $a1, $0, 60
   addi   $a2, $0, 100
   addi	  $a3, $0, 64
   jal    Line

   addi   $a0, $0, 90
   addi   $a1, $0, 60
   addi   $a2, $0, 90
   addi	  $a3, $0, 64
   jal    Line

   addi   $a0, $0, 80
   addi   $a1, $0, 60
   addi   $a2, $0, 80
   addi	  $a3, $0, 64
   jal    Line
   
   addi   $a0, $0, 70
   addi   $a1, $0, 60
   addi   $a2, $0, 70
   addi	  $a3, $0, 64
   jal    Line
   
   addi   $a0, $0, 60
   addi   $a1, $0, 60
   addi   $a2, $0, 60
   addi	  $a3, $0, 64
   jal    Line


   #Inside
   addi   $a0, $0, 94
   addi   $a1, $0, 100
   addi   $a2, $0, 80
   addi	  $a3, $0, 60
   jal    Line
   
   addi   $a0, $0, 87
   addi   $a1, $0, 100
   addi   $a2, $0, 70
   addi	  $a3, $0, 60
   jal    Line
   
   addi   $a0, $0, 76
   addi   $a1, $0, 90
   addi   $a2, $0, 90
   addi	  $a3, $0, 90
   jal    Line
   
   addi   $a0, $0, 70
   addi   $a1, $0, 80
   addi   $a2, $0, 86
   addi	  $a3, $0, 80
   jal    Line
   
   addi   $a0, $0, 65
   addi   $a1, $0, 70
   addi   $a2, $0, 84
   addi	  $a3, $0, 70
   jal    Line
   
   #X (Down Right)
   addi   $a0, $0, 80
   addi   $a1, $0, 100
   addi   $a2, $0, 90
   addi	  $a3, $0, 90
   jal    Line
   
   addi   $a0, $0, 76
   addi   $a1, $0, 90
   addi   $a2, $0, 86
   addi	  $a3, $0, 80
   jal    Line
   
   addi   $a0, $0, 70
   addi   $a1, $0, 80
   addi   $a2, $0, 84
   addi	  $a3, $0, 70
   jal    Line
   
   addi   $a0, $0, 65
   addi   $a1, $0, 70
   addi   $a2, $0, 80
   addi	  $a3, $0, 60
   jal    Line
   
   #X (Down Left)
   addi   $a0, $0, 94
   addi   $a1, $0, 100
   addi   $a2, $0, 76
   addi	  $a3, $0, 90
   jal    Line
   
   addi   $a0, $0, 90
   addi   $a1, $0, 90
   addi   $a2, $0, 70
   addi	  $a3, $0, 80
   jal    Line
   
   addi   $a0, $0, 86
   addi   $a1, $0, 80
   addi   $a2, $0, 65
   addi	  $a3, $0, 70
   jal    Line
   
   addi   $a0, $0, 84
   addi   $a1, $0, 70
   addi   $a2, $0, 60
   addi	  $a3, $0, 60
   jal    Line
   
   #Bottom Left Stuff
   addi   $a0, $0, 80
   addi   $a1, $0, 60
   addi   $a2, $0, 50
   addi	  $a3, $0, 20
   jal    Line
   
   addi   $a0, $0, 70
   addi   $a1, $0, 60
   addi   $a2, $0, 35
   addi	  $a3, $0, 20
   jal    Line
   
   addi   $a0, $0, 20
   addi   $a1, $0, 20
   addi   $a2, $0, 50
   addi	  $a3, $0, 20
   jal    Line

   addi   $a0, $0, 40
   addi   $a1, $0, 40
   addi   $a2, $0, 64
   addi	  $a3, $0, 40
   jal    Line
   
   addi   $a0, $0, 50
   addi   $a1, $0, 50
   addi   $a2, $0, 72
   addi	  $a3, $0, 50
   jal    Line
   
   #X (Down Right)
   addi   $a0, $0, 60
   addi   $a1, $0, 60
   addi   $a2, $0, 72
   addi	  $a3, $0, 50
   jal    Line
   
   addi   $a0, $0, 50
   addi   $a1, $0, 50
   addi   $a2, $0, 64
   addi	  $a3, $0, 40
   jal    Line
   
   addi   $a0, $0, 40
   addi   $a1, $0, 40
   addi   $a2, $0, 50
   addi	  $a3, $0, 20
   jal    Line
   
   #X (Down Left)
   addi   $a0, $0, 80
   addi   $a1, $0, 60
   addi   $a2, $0, 50
   addi	  $a3, $0, 50
   jal    Line
   
   addi   $a0, $0, 72
   addi   $a1, $0, 50
   addi   $a2, $0, 40
   addi	  $a3, $0, 40
   jal    Line
   
   addi   $a0, $0, 64
   addi   $a1, $0, 40
   addi   $a2, $0, 20
   addi	  $a3, $0, 20
   jal    Line
   
   #X Middle
   addi   $a0, $0, 30
   addi   $a1, $0, 30
   addi   $a2, $0, 58
   addi	  $a3, $0, 30
   jal    Line
   
   addi   $a0, $0, 45
   addi   $a1, $0, 45
   addi   $a2, $0, 69
   addi	  $a3, $0, 45
   jal    Line
   
   addi   $a0, $0, 55
   addi   $a1, $0, 55
   addi   $a2, $0, 77
   addi	  $a3, $0, 55
   jal    Line
   
   # Top Rail
   addi   $a0, $0, 80
   addi   $a1, $0, 100
   addi   $a2, $0, 100
   addi	  $a3, $0, 100
   jal    Line
   
   addi   $a0, $0, 78
   addi   $a1, $0, 106
   addi   $a2, $0, 100
   addi	  $a3, $0, 106
   jal    Line
   
   addi   $a0, $0, 80
   addi   $a1, $0, 100
   addi   $a2, $0, 78
   addi	  $a3, $0, 106
   jal    Line
   
   addi   $a0, $0, 100
   addi   $a1, $0, 100
   addi   $a2, $0, 100
   addi	  $a3, $0, 106
   jal    Line
   
   addi   $a0, $0, 84
   addi   $a1, $0, 100
   addi   $a2, $0, 84
   addi	  $a3, $0, 106
   jal    Line
   
   addi   $a0, $0, 92
   addi   $a1, $0, 100
   addi   $a2, $0, 92
   addi	  $a3, $0, 106
   jal    Line
   
   # Top
   addi   $a0, $0, 100
   addi   $a1, $0, 200
   addi   $a2, $0, 100
   addi	  $a3, $0, 150
   jal    Line
   
   addi   $a0, $0, 94
   addi   $a1, $0, 100
   addi   $a2, $0, 100
   addi	  $a3, $0, 150
   jal    Line
   
   # Top Horizontals
   addi   $a0, $0, 82
   addi   $a1, $0, 110
   addi   $a2, $0, 94
   addi	  $a3, $0, 110
   jal    Line
   
   addi   $a0, $0, 84
   addi   $a1, $0, 120
   addi   $a2, $0, 95
   addi	  $a3, $0, 120
   jal    Line
   
   addi   $a0, $0, 86
   addi   $a1, $0, 130
   addi   $a2, $0, 97
   addi	  $a3, $0, 130
   jal    Line
   
   addi   $a0, $0, 88
   addi   $a1, $0, 140
   addi   $a2, $0, 98
   addi	  $a3, $0, 140
   jal    Line
   
   addi   $a0, $0, 90
   addi   $a1, $0, 150
   addi   $a2, $0, 100
   addi	  $a3, $0, 150
   jal    Line
   
   addi   $a0, $0, 92
   addi   $a1, $0, 160
   addi   $a2, $0, 100
   addi	  $a3, $0, 160
   jal    Line
   
   addi   $a0, $0, 94
   addi   $a1, $0, 170
   addi   $a2, $0, 100
   addi	  $a3, $0, 170
   jal    Line
   
   addi   $a0, $0, 96
   addi   $a1, $0, 180
   addi   $a2, $0, 100
   addi	  $a3, $0, 180
   jal    Line
   
   # Top X (Up Right)
   addi   $a0, $0, 82
   addi   $a1, $0, 110
   addi   $a2, $0, 95
   addi	  $a3, $0, 120
   jal    Line
   
   addi   $a0, $0, 84
   addi   $a1, $0, 120
   addi   $a2, $0, 97
   addi	  $a3, $0, 130
   jal    Line
   
   addi   $a0, $0, 86
   addi   $a1, $0, 130
   addi   $a2, $0, 98
   addi	  $a3, $0, 140
   jal    Line
   
   addi   $a0, $0, 88
   addi   $a1, $0, 140
   addi   $a2, $0, 100
   addi	  $a3, $0, 150
   jal    Line
   
   addi   $a0, $0, 90
   addi   $a1, $0, 150
   addi   $a2, $0, 100
   addi	  $a3, $0, 160
   jal    Line
   
   addi   $a0, $0, 92
   addi   $a1, $0, 160
   addi   $a2, $0, 100
   addi	  $a3, $0, 170
   jal    Line
   
   addi   $a0, $0, 94
   addi   $a1, $0, 170
   addi   $a2, $0, 100
   addi	  $a3, $0, 180
   jal    Line
   
   addi   $a0, $0, 96
   addi   $a1, $0, 180
   addi   $a2, $0, 100
   addi	  $a3, $0, 190
   jal    Line
   
   # Top X (Down Left)
   addi   $a0, $0, 84
   addi   $a1, $0, 120
   addi   $a2, $0, 94
   addi	  $a3, $0, 110
   jal    Line
   
   addi   $a0, $0, 86
   addi   $a1, $0, 130
   addi   $a2, $0, 95
   addi	  $a3, $0, 120
   jal    Line
   
   addi   $a0, $0, 88
   addi   $a1, $0, 140
   addi   $a2, $0, 97
   addi	  $a3, $0, 130
   jal    Line
   
   addi   $a0, $0, 90
   addi   $a1, $0, 150
   addi   $a2, $0, 98
   addi	  $a3, $0, 140
   jal    Line
   
   addi   $a0, $0, 92
   addi   $a1, $0, 160
   addi   $a2, $0, 100
   addi	  $a3, $0, 150
   jal    Line
   
   addi   $a0, $0, 94
   addi   $a1, $0, 170
   addi   $a2, $0, 100
   addi	  $a3, $0, 160
   jal    Line
   
   addi   $a0, $0, 96
   addi   $a1, $0, 180
   addi   $a2, $0, 100
   addi	  $a3, $0, 170
   jal    Line
   
   addi   $a0, $0, 98
   addi   $a1, $0, 190
   addi   $a2, $0, 100
   addi	  $a3, $0, 180
   jal    Line
   
   addi   $a0, $0, 82
   addi   $a1, $0, 110
   addi   $a2, $0, 86
   addi	  $a3, $0, 106
   jal    Line
   
   addi   $a0, $0, 94
   addi   $a1, $0, 110
   addi   $a2, $0, 88
   addi	  $a3, $0, 106
   jal    Line
   
   # Very Top Balcony
   addi   $a0, $0, 96
   addi   $a1, $0, 199
   addi   $a2, $0, 100
   addi	  $a3, $0, 199
   jal    Line
   
   addi   $a0, $0, 96
   addi   $a1, $0, 196
   addi   $a2, $0, 100
   addi	  $a3, $0, 196
   jal    Line
   
   addi   $a0, $0, 96
   addi   $a1, $0, 196
   addi   $a2, $0, 96
   addi	  $a3, $0, 199
   jal    Line
   
   addi   $a0, $0, 97
   addi   $a1, $0, 196
   addi   $a2, $0, 97
   addi	  $a3, $0, 199
   jal    Line
   
   addi   $a0, $0, 98
   addi   $a1, $0, 196
   addi   $a2, $0, 98
   addi	  $a3, $0, 199
   jal    Line
   
   addi   $a0, $0, 99
   addi   $a1, $0, 196
   addi   $a2, $0, 99
   addi	  $a3, $0, 199
   jal    Line
   
   
   #RIGHT SIDE ******************************
      #Top
   addi   $a0, $0, 100
   addi   $a1, $0, 200
   addi   $a2, $0, 100
   addi	  $a3, $0, 212
   jal    Line
   
   
   #Bottom Rail
   addi   $a0, $0, 140
   addi   $a1, $0, 60
   addi   $a2, $0, 100
   addi	  $a3, $0, 60
   jal    Line
   
   addi   $a0, $0, 140
   addi   $a1, $0, 64
   addi   $a2, $0, 100
   addi	  $a3, $0, 64
   jal    Line

   addi   $a0, $0, 100
   addi   $a1, $0, 60
   addi   $a2, $0, 100
   addi	  $a3, $0, 64
   jal    Line

   addi   $a0, $0, 110
   addi   $a1, $0, 60
   addi   $a2, $0, 110
   addi	  $a3, $0, 64
   jal    Line

   addi   $a0, $0, 120
   addi   $a1, $0, 60
   addi   $a2, $0, 120
   addi	  $a3, $0, 64
   jal    Line
   
   addi   $a0, $0, 130
   addi   $a1, $0, 60
   addi   $a2, $0, 130
   addi	  $a3, $0, 64
   jal    Line
   
   addi   $a0, $0, 140
   addi   $a1, $0, 60
   addi   $a2, $0, 140
   addi	  $a3, $0, 64
   jal    Line


   #Inside
   addi   $a0, $0, 106
   addi   $a1, $0, 100
   addi   $a2, $0, 120
   addi	  $a3, $0, 60
   jal    Line
   
   addi   $a0, $0, 113
   addi   $a1, $0, 100
   addi   $a2, $0, 130
   addi	  $a3, $0, 60
   jal    Line
   
   addi   $a0, $0, 124
   addi   $a1, $0, 90
   addi   $a2, $0, 110
   addi	  $a3, $0, 90
   jal    Line
   
   addi   $a0, $0, 130
   addi   $a1, $0, 80
   addi   $a2, $0, 114
   addi	  $a3, $0, 80
   jal    Line
   
   addi   $a0, $0, 135
   addi   $a1, $0, 70
   addi   $a2, $0, 116
   addi	  $a3, $0, 70
   jal    Line
   
   #X (Down Right)
   addi   $a0, $0, 120
   addi   $a1, $0, 100
   addi   $a2, $0, 110
   addi	  $a3, $0, 90
   jal    Line
   
   addi   $a0, $0, 124
   addi   $a1, $0, 90
   addi   $a2, $0, 114
   addi	  $a3, $0, 80
   jal    Line
   
   addi   $a0, $0, 130
   addi   $a1, $0, 80
   addi   $a2, $0, 116
   addi	  $a3, $0, 70
   jal    Line
   
   addi   $a0, $0, 135
   addi   $a1, $0, 70
   addi   $a2, $0, 120
   addi	  $a3, $0, 60
   jal    Line
   
   #X (Down Left)
   addi   $a0, $0, 106
   addi   $a1, $0, 100
   addi   $a2, $0, 124
   addi	  $a3, $0, 90
   jal    Line
   
   addi   $a0, $0, 110
   addi   $a1, $0, 90
   addi   $a2, $0, 130
   addi	  $a3, $0, 80
   jal    Line
   
   addi   $a0, $0, 114
   addi   $a1, $0, 80
   addi   $a2, $0, 135
   addi	  $a3, $0, 70
   jal    Line
   
   addi   $a0, $0, 116
   addi   $a1, $0, 70
   addi   $a2, $0, 140
   addi	  $a3, $0, 60
   jal    Line
   
   #Bottom Left Stuff
   addi   $a0, $0, 120
   addi   $a1, $0, 60
   addi   $a2, $0, 150
   addi	  $a3, $0, 20
   jal    Line
   
   addi   $a0, $0, 130
   addi   $a1, $0, 60
   addi   $a2, $0, 165
   addi	  $a3, $0, 20
   jal    Line
   
   addi   $a0, $0, 180
   addi   $a1, $0, 20
   addi   $a2, $0, 150
   addi	  $a3, $0, 20
   jal    Line

   addi   $a0, $0, 160
   addi   $a1, $0, 40
   addi   $a2, $0, 136
   addi	  $a3, $0, 40
   jal    Line
   
   addi   $a0, $0, 150
   addi   $a1, $0, 50
   addi   $a2, $0, 128
   addi	  $a3, $0, 50
   jal    Line
   
   #X (Down Right)
   addi   $a0, $0, 140
   addi   $a1, $0, 60
   addi   $a2, $0, 128
   addi	  $a3, $0, 50
   jal    Line
   
   addi   $a0, $0, 150
   addi   $a1, $0, 50
   addi   $a2, $0, 136
   addi	  $a3, $0, 40
   jal    Line
   
   addi   $a0, $0, 160
   addi   $a1, $0, 40
   addi   $a2, $0, 150
   addi	  $a3, $0, 20
   jal    Line
   
   #X (Down Left)
   addi   $a0, $0, 120
   addi   $a1, $0, 60
   addi   $a2, $0, 150
   addi	  $a3, $0, 50
   jal    Line
   
   addi   $a0, $0, 128
   addi   $a1, $0, 50
   addi   $a2, $0, 160
   addi	  $a3, $0, 40
   jal    Line
   
   addi   $a0, $0, 136
   addi   $a1, $0, 40
   addi   $a2, $0, 180
   addi	  $a3, $0, 20
   jal    Line
   
   #X Middle
   addi   $a0, $0, 170
   addi   $a1, $0, 30
   addi   $a2, $0, 142
   addi	  $a3, $0, 30
   jal    Line
   
   addi   $a0, $0, 155
   addi   $a1, $0, 45
   addi   $a2, $0, 131
   addi	  $a3, $0, 45
   jal    Line
   
   addi   $a0, $0, 145
   addi   $a1, $0, 55
   addi   $a2, $0, 123
   addi	  $a3, $0, 55
   jal    Line
   
   # Top Rail
   addi   $a0, $0, 120
   addi   $a1, $0, 100
   addi   $a2, $0, 100
   addi	  $a3, $0, 100
   jal    Line
   
   addi   $a0, $0, 122
   addi   $a1, $0, 106
   addi   $a2, $0, 100
   addi	  $a3, $0, 106
   jal    Line
   
   addi   $a0, $0, 120
   addi   $a1, $0, 100
   addi   $a2, $0, 122
   addi	  $a3, $0, 106
   jal    Line
   
   addi   $a0, $0, 100
   addi   $a1, $0, 100
   addi   $a2, $0, 100
   addi	  $a3, $0, 106
   jal    Line
   
   addi   $a0, $0, 116
   addi   $a1, $0, 100
   addi   $a2, $0, 116
   addi	  $a3, $0, 106
   jal    Line
   
   addi   $a0, $0, 108
   addi   $a1, $0, 100
   addi   $a2, $0, 108
   addi	  $a3, $0, 106
   jal    Line
   
   # Top
   addi   $a0, $0, 100
   addi   $a1, $0, 200
   addi   $a2, $0, 100
   addi	  $a3, $0, 150
   jal    Line
   
   addi   $a0, $0, 106
   addi   $a1, $0, 100
   addi   $a2, $0, 100
   addi	  $a3, $0, 150
   jal    Line
   
   # Top Horizontals
   addi   $a0, $0, 118
   addi   $a1, $0, 110
   addi   $a2, $0, 106
   addi	  $a3, $0, 110
   jal    Line
   
   addi   $a0, $0, 116
   addi   $a1, $0, 120
   addi   $a2, $0, 105
   addi	  $a3, $0, 120
   jal    Line
   
   addi   $a0, $0, 114
   addi   $a1, $0, 130
   addi   $a2, $0, 103
   addi	  $a3, $0, 130
   jal    Line
   
   addi   $a0, $0, 112
   addi   $a1, $0, 140
   addi   $a2, $0, 102
   addi	  $a3, $0, 140
   jal    Line
   
   addi   $a0, $0, 110
   addi   $a1, $0, 150
   addi   $a2, $0, 100
   addi	  $a3, $0, 150
   jal    Line
   
   addi   $a0, $0, 108
   addi   $a1, $0, 160
   addi   $a2, $0, 100
   addi	  $a3, $0, 160
   jal    Line
   
   addi   $a0, $0, 106
   addi   $a1, $0, 170
   addi   $a2, $0, 100
   addi	  $a3, $0, 170
   jal    Line
   
   addi   $a0, $0, 104
   addi   $a1, $0, 180
   addi   $a2, $0, 100
   addi	  $a3, $0, 180
   jal    Line
   
   # Top X (Up Right)
   addi   $a0, $0, 118
   addi   $a1, $0, 110
   addi   $a2, $0, 105
   addi	  $a3, $0, 120
   jal    Line
   
   addi   $a0, $0, 116
   addi   $a1, $0, 120
   addi   $a2, $0, 103
   addi	  $a3, $0, 130
   jal    Line
   
   addi   $a0, $0, 114
   addi   $a1, $0, 130
   addi   $a2, $0, 102
   addi	  $a3, $0, 140
   jal    Line
   
   addi   $a0, $0, 112
   addi   $a1, $0, 140
   addi   $a2, $0, 100
   addi	  $a3, $0, 150
   jal    Line
   
   addi   $a0, $0, 110
   addi   $a1, $0, 150
   addi   $a2, $0, 100
   addi	  $a3, $0, 160
   jal    Line
   
   addi   $a0, $0, 108
   addi   $a1, $0, 160
   addi   $a2, $0, 100
   addi	  $a3, $0, 170
   jal    Line
   
   addi   $a0, $0, 106
   addi   $a1, $0, 170
   addi   $a2, $0, 100
   addi	  $a3, $0, 180
   jal    Line
   
   addi   $a0, $0, 104
   addi   $a1, $0, 180
   addi   $a2, $0, 100
   addi	  $a3, $0, 190
   jal    Line
   
   # Top X (Down Left)
   addi   $a0, $0, 116
   addi   $a1, $0, 120
   addi   $a2, $0, 106
   addi	  $a3, $0, 110
   jal    Line
   
   addi   $a0, $0, 114
   addi   $a1, $0, 130
   addi   $a2, $0, 105
   addi	  $a3, $0, 120
   jal    Line
   
   addi   $a0, $0, 112
   addi   $a1, $0, 140
   addi   $a2, $0, 103
   addi	  $a3, $0, 130
   jal    Line
   
   addi   $a0, $0, 110
   addi   $a1, $0, 150
   addi   $a2, $0, 102
   addi	  $a3, $0, 140
   jal    Line
   
   addi   $a0, $0, 108
   addi   $a1, $0, 160
   addi   $a2, $0, 100
   addi	  $a3, $0, 150
   jal    Line
   
   addi   $a0, $0, 106
   addi   $a1, $0, 170
   addi   $a2, $0, 100
   addi	  $a3, $0, 160
   jal    Line
   
   addi   $a0, $0, 104
   addi   $a1, $0, 180
   addi   $a2, $0, 100
   addi	  $a3, $0, 170
   jal    Line
   
   addi   $a0, $0, 102
   addi   $a1, $0, 190
   addi   $a2, $0, 100
   addi	  $a3, $0, 180
   jal    Line
   
   addi   $a0, $0, 118
   addi   $a1, $0, 110
   addi   $a2, $0, 114
   addi	  $a3, $0, 106
   jal    Line
   
   addi   $a0, $0, 106
   addi   $a1, $0, 110
   addi   $a2, $0, 112
   addi	  $a3, $0, 106
   jal    Line
   
   # Very Top Balcony
   addi   $a0, $0, 104
   addi   $a1, $0, 199
   addi   $a2, $0, 100
   addi	  $a3, $0, 199
   jal    Line
   
   addi   $a0, $0, 104
   addi   $a1, $0, 196
   addi   $a2, $0, 100
   addi	  $a3, $0, 196
   jal    Line
   
   addi   $a0, $0, 104
   addi   $a1, $0, 196
   addi   $a2, $0, 104
   addi	  $a3, $0, 199
   jal    Line
   
   addi   $a0, $0, 103
   addi   $a1, $0, 196
   addi   $a2, $0, 103
   addi	  $a3, $0, 199
   jal    Line
   
   addi   $a0, $0, 102
   addi   $a1, $0, 196
   addi   $a2, $0, 102
   addi	  $a3, $0, 199
   jal    Line
   
   addi   $a0, $0, 101
   addi   $a1, $0, 196
   addi   $a2, $0, 101
   addi	  $a3, $0, 199
   jal    Line
   
   #Middle*********
   
   #Arch (Left)
   addi   $a0, $0, 74
   addi   $a1, $0, 50
   addi   $a2, $0, 80
   addi	  $a3, $0, 54
   jal    Line
   
   addi   $a0, $0, 80
   addi   $a1, $0, 54
   addi   $a2, $0, 84
   addi	  $a3, $0, 56
   jal    Line
   
   addi   $a0, $0, 84
   addi   $a1, $0, 56
   addi   $a2, $0, 88
   addi	  $a3, $0, 58
   jal    Line
   
   addi   $a0, $0, 88
   addi   $a1, $0, 58
   addi   $a2, $0, 96
   addi	  $a3, $0, 59
   jal    Line
   
   addi   $a0, $0, 96
   addi   $a1, $0, 59
   addi   $a2, $0, 100
   addi	  $a3, $0, 59
   jal    Line
   
   #Arch (Right)
   addi   $a0, $0, 126
   addi   $a1, $0, 50
   addi   $a2, $0, 120
   addi	  $a3, $0, 54
   jal    Line
   
   addi   $a0, $0, 120
   addi   $a1, $0, 54
   addi   $a2, $0, 116
   addi	  $a3, $0, 56
   jal    Line
   
   addi   $a0, $0, 116
   addi   $a1, $0, 56
   addi   $a2, $0, 112
   addi	  $a3, $0, 58
   jal    Line
   
   addi   $a0, $0, 112
   addi   $a1, $0, 58
   addi   $a2, $0, 104
   addi	  $a3, $0, 59
   jal    Line
   
   addi   $a0, $0, 104
   addi   $a1, $0, 59
   addi   $a2, $0, 100
   addi	  $a3, $0, 59
   jal    Line
   
   #Arch2 (Left)
   addi   $a0, $0, 68
   addi   $a1, $0, 44
   addi   $a2, $0, 74
   addi	  $a3, $0, 48
   jal    Line
   
   addi   $a0, $0, 74
   addi   $a1, $0, 48
   addi   $a2, $0, 80
   addi	  $a3, $0, 52
   jal    Line
   
   addi   $a0, $0, 80
   addi   $a1, $0, 52
   addi   $a2, $0, 84
   addi	  $a3, $0, 54
   jal    Line
   
   addi   $a0, $0, 84
   addi   $a1, $0, 54
   addi   $a2, $0, 88
   addi	  $a3, $0, 56
   jal    Line
   
   addi   $a0, $0, 88
   addi   $a1, $0, 56
   addi   $a2, $0, 96
   addi	  $a3, $0, 57
   jal    Line
   
   addi   $a0, $0, 96
   addi   $a1, $0, 57
   addi   $a2, $0, 100
   addi	  $a3, $0, 57
   jal    Line
   
   #Arch2 (Right)
   addi   $a0, $0, 132
   addi   $a1, $0, 44
   addi   $a2, $0, 126
   addi	  $a3, $0, 48
   jal    Line
   
   addi   $a0, $0, 126
   addi   $a1, $0, 48
   addi   $a2, $0, 120
   addi	  $a3, $0, 52
   jal    Line
   
   addi   $a0, $0, 120
   addi   $a1, $0, 52
   addi   $a2, $0, 116
   addi	  $a3, $0, 54
   jal    Line
   
   addi   $a0, $0, 116
   addi   $a1, $0, 54
   addi   $a2, $0, 112
   addi	  $a3, $0, 56
   jal    Line
   
   addi   $a0, $0, 112
   addi   $a1, $0, 56
   addi   $a2, $0, 104
   addi	  $a3, $0, 57
   jal    Line
   
   addi   $a0, $0, 104
   addi   $a1, $0, 57
   addi   $a2, $0, 100
   addi	  $a3, $0, 57
   jal    Line
   
   # Top Middle X
   addi   $a0, $0, 95
   addi   $a1, $0, 110
   addi   $a2, $0, 104
   addi	  $a3, $0, 120
   jal    Line
   
   addi   $a0, $0, 96
   addi   $a1, $0, 120
   addi   $a2, $0, 102
   addi	  $a3, $0, 130
   jal    Line
   
   addi   $a0, $0, 98
   addi   $a1, $0, 130
   addi   $a2, $0, 102
   addi	  $a3, $0, 140
   jal    Line
   
   addi   $a0, $0, 105
   addi   $a1, $0, 110
   addi   $a2, $0, 96
   addi	  $a3, $0, 120
   jal    Line
   
   addi   $a0, $0, 104
   addi   $a1, $0, 120
   addi   $a2, $0, 98
   addi	  $a3, $0, 130
   jal    Line
   
   addi   $a0, $0, 102
   addi   $a1, $0, 130
   addi   $a2, $0, 98
   addi	  $a3, $0, 140
   jal    Line
   
   #3D****
   addi   $a0, $0, 100
   addi   $a1, $0, 200
   addi   $a2, $0, 122
   addi	  $a3, $0, 106
   jal    Line
   
   addi   $a0, $0, 100
   addi   $a1, $0, 200
   addi   $a2, $0, 121
   addi	  $a3, $0, 105
   jal    Line
   
   
   addi   $a0, $0, 122
   addi   $a1, $0, 106
   addi   $a2, $0, 141
   addi	  $a3, $0, 66
   jal    Line
   
   addi   $a0, $0, 121
   addi   $a1, $0, 105
   addi   $a2, $0, 140
   addi	  $a3, $0, 65
   jal    Line
   
   addi   $a0, $0, 120
   addi   $a1, $0, 104
   addi   $a2, $0, 139
   addi	  $a3, $0, 64
   jal    Line
   
   
   addi   $a0, $0, 141
   addi   $a1, $0, 66
   addi   $a2, $0, 181
   addi	  $a3, $0, 26
   jal    Line
   
   addi   $a0, $0, 141
   addi   $a1, $0, 65
   addi   $a2, $0, 181
   addi	  $a3, $0, 25
   jal    Line
   
   addi   $a0, $0, 141
   addi   $a1, $0, 64
   addi   $a2, $0, 181
   addi	  $a3, $0, 24
   jal    Line
   
   addi   $a0, $0, 141
   addi   $a1, $0, 63
   addi   $a2, $0, 181
   addi	  $a3, $0, 23
   jal    Line
   
   addi   $a0, $0, 141
   addi   $a1, $0, 62
   addi   $a2, $0, 181
   addi	  $a3, $0, 22
   jal    Line
   
   addi   $a0, $0, 141
   addi   $a1, $0, 61
   addi   $a2, $0, 181
   addi	  $a3, $0, 21
   jal    Line
   
   
   
   addi   $a0, $0, 181
   addi   $a1, $0, 26
   addi   $a2, $0, 180
   addi	  $a3, $0, 20
   jal    Line
   
   
   addi   $a0, $0, 98
   addi   $a1, $0, 100
   addi   $a2, $0, 86
   addi	  $a3, $0, 64
   jal    Line
   
   addi   $a0, $0, 97
   addi   $a1, $0, 100
   addi   $a2, $0, 85
   addi	  $a3, $0, 64
   jal    Line
   
   addi   $a0, $0, 96
   addi   $a1, $0, 100
   addi   $a2, $0, 84
   addi	  $a3, $0, 64
   jal    Line
   
   addi   $a0, $0, 95
   addi   $a1, $0, 100
   addi   $a2, $0, 83
   addi	  $a3, $0, 64
   jal    Line
   
   
   addi   $a0, $0, 80
   addi   $a1, $0, 52
   addi   $a2, $0, 64
   addi	  $a3, $0, 26
   jal    Line
   
   addi   $a0, $0, 79
   addi   $a1, $0, 51
   addi   $a2, $0, 62
   addi	  $a3, $0, 25
   jal    Line
   
   addi   $a0, $0, 78
   addi   $a1, $0, 50
   addi   $a2, $0, 60
   addi	  $a3, $0, 24
   jal    Line
   
   addi   $a0, $0, 77
   addi   $a1, $0, 49
   addi   $a2, $0, 58
   addi	  $a3, $0, 24
   jal    Line
   
   addi   $a0, $0, 75
   addi   $a1, $0, 48
   addi   $a2, $0, 56
   addi	  $a3, $0, 24
   jal    Line
   
   addi   $a0, $0, 73
   addi   $a1, $0, 47
   addi   $a2, $0, 54
   addi	  $a3, $0, 23
   jal    Line
   
   addi   $a0, $0, 72
   addi   $a1, $0, 46
   addi   $a2, $0, 52
   addi	  $a3, $0, 23
   jal    Line
   
   addi   $a0, $0, 71
   addi   $a1, $0, 45
   addi   $a2, $0, 50
   addi	  $a3, $0, 22
   jal    Line
   
   
   addi   $a0, $0, 64
   addi   $a1, $0, 26
   addi   $a2, $0, 50
   addi	  $a3, $0, 20
   jal    Line
   
   j      End

Circle:
   add    $t0, $0, $0           # x = 0
   add    $t1, $a2, $0          # y = r
   addi   $t3, $0, 3
   sll    $t2, $a2, 1           # r * 2
   sub    $t2, $t3, $t2         # g = 3 - 2 * r

   addi   $t4, $0, 10
   sll    $t3, $a2, 2           # r * 4
   sub    $t3, $t4, $t3         # diagonalInc = 10 - 4 * r
   
   addi   $t4, $0, 6            # rightInc = 0
   
   addi   $t5, $t1, 1           # y + 1
   
   CircleLoop:
      beq    $t0, $t5, EndCircleLoop
      
      # plot(xc + x, yc + y)
      add    $t6, $a0, $t0
      add    $t7, $a1, $t1
      
      sw     $t6, 0($sp)
      sw     $t7, 1($sp)
      addi   $sp, $sp, 2
      
      # plot(xc + x, yc - y)
      add    $t6, $a0, $t0
      sub    $t7, $a1, $t1
      
      sw     $t6, 0($sp)
      sw     $t7, 1($sp)
      addi   $sp, $sp, 2
      
      # plot(xc - x, yc + y)
      sub    $t6, $a0, $t0
      add    $t7, $a1, $t1
      
      sw     $t6, 0($sp)
      sw     $t7, 1($sp)
      addi   $sp, $sp, 2
      
      # plot(xc - x, yc - y)
      sub    $t6, $a0, $t0
      sub    $t7, $a1, $t1
      
      sw     $t6, 0($sp)
      sw     $t7, 1($sp)
      addi   $sp, $sp, 2
      
      # plot(xc + y, yc + x)
      add    $t6, $a0, $t1
      add    $t7, $a1, $t0
      
      sw     $t6, 0($sp)
      sw     $t7, 1($sp)
      addi   $sp, $sp, 2
      
      # plot(xc + y, yc - x)
      add    $t6, $a0, $t1
      sub    $t7, $a1, $t0
      
      sw     $t6, 0($sp)
      sw     $t7, 1($sp)
      addi   $sp, $sp, 2
      
      # plot(xc - y, yc + x)
      sub    $t6, $a0, $t1
      add    $t7, $a1, $t0
      
      sw     $t6, 0($sp)
      sw     $t7, 1($sp)
      addi   $sp, $sp, 2
      
      # plot(xc - y, yc - x)
      sub    $t6, $a0, $t1
      sub    $t7, $a1, $t0
      
      sw     $t6, 0($sp)
      sw     $t7, 1($sp)
      addi   $sp, $sp, 2


      slt    $t6, $t2, $0
      bne    $t6, $0, GELSE
      
      add    $t2, $t2, $t3
      addi   $t3, $t3, 8
      addi    $t5, $t1, 1
      addi   $t1, $t1, -1
      
      j      skipGELSE
      
      GELSE:
         add    $t2, $t2, $t4
         addi   $t3, $t3, 4
      
      skipGELSE:
      
      addi   $t4, $t4, 4        # rightInc += 4
      addi   $t0, $t0, 1        # x += 1
      
      j      CircleLoop
      
   EndCircleLoop:
      jr     $ra
  
Line: #a0 = x0, a1 = y0, a2 = x1, a3 = y1

   slt    $t0, $a2, $a0         # Check if x1 < x0
   beq    $t0, $0, skipabsdx    # Skip abs

   sub    $t0, $a0, $a2         # dx = x0 - x1
   j      L1

   skipabsdx:
      sub    $t0, $a2, $a0      # dx = x1 - x0

   L1:

      slt    $t1, $a3, $a1      # Check if y1 < y0
      beq    $t1, $0, skipabsdy # Skip abs

      sub    $t1, $a1, $a3      # dy = y0 - y1
      j	     L2

   skipabsdy:
      sub    $t1, $a3, $a1      # dy = y1 - y0

   L2:
      addi   $t3, $0, 1         # st = 1
      slt    $t2, $t0, $t1      # Checks if dx < dy
      bne    $t2, $0, skipst

      add    $t3, $0, $0        # st = 0

      skipst:

      beq    $t3, $0, skip1

      add    $t4, $a0, $0
      add    $a0, $a1, $0
      add    $a1, $t4, $0

      add    $t4, $a2, $0
      add    $a2, $a3, $0
      add    $a3, $t4, $0

      skip1:

      slt    $t4, $a2, $a0
      beq    $t4, $0, skip2

      add    $t4, $a0, $0
      add    $a0, $a2, $0
      add    $a2, $t4, $0

      add    $t4, $a1, $0
      add    $a1, $a3, $0
      add    $a3, $t4, $0

      skip2:

      sub    $t0, $a2, $a0       # dx = x1 - x0

      slt    $t1, $a3, $a1       # Check if y1 < y0
      beq    $t1, $0, skipabsdy2 # Skip abs

      sub    $t1, $a1, $a3       # dy = y0 - y1
      j	     L3

      skipabsdy2:
      sub    $t1, $a3, $a1       # dy = y1 - y0

      L3:

      add    $t2, $0, $0         # error = 0
      add    $t4, $a1, $0        # y = y0

      addi   $t5, $0, 1	         # ystep = 1
      slt    $t6, $a1, $a3       # Check if y0 < y1
      bne    $t6, $0, skip3

      addi   $t5, $0, -1         # ystep = -1

      skip3:

      add    $t6, $a0, $0        # i = x0
      addi   $t7, $a2, 1

      LineLoop:
         beq   $t6, $t7, ExitLineLoop

         beq   $t3, $0, STELSE

         sw    $t4, 0($sp)
         sw    $t6, 1($sp)
         addi  $sp, $sp, 2

         j     L4

         STELSE:
            sw    $t4, 1($sp)
            sw    $t6, 0($sp)
            addi  $sp, $sp, 2

         L4:

         add   $t2, $t2, $t1      # error = error + dy
         sll   $t8, $t2,  1       # error * 2
         slt   $t9, $t8, $t0      # Checks if error * 2 < dx

         bne   $t9, $0, skip4

         add   $t4, $t4, $t5
         sub   $t2, $t2, $t0

         skip4:

         addi   $t6, $t6, 1       #i++
         j      LineLoop

         ExitLineLoop:
            jr   $ra

End: