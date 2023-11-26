#  open and read the file data
set fp [open "input.txt" r]
set file_data [read $fp]
close $fp

set string_sum 0
set integer_sum 0

#  Process data file
set data [split $file_data "\n"]
foreach line $data {
    if {[string is integer -strict $line]} {
        if {$line%2 == 0} {
            set integer_sum [expr $integer_sum + $line * 2]
            puts [expr $line * 2]
        } else {
            set integer_sum [expr $integer_sum + $line * 3]
            puts [expr $line * 3]
        }
    } elseif {[string is double -strict $line]} {
        puts $line
    } elseif {[string is wordchar $line]} {
        set string_sum [expr $string_sum + 1]
        puts $line
    } else {
        puts "INVALID"
    }
}

puts "Sum of all integers (after multiplying them by 3 or 2) = $integer_sum"
puts "Count of all lines that present a string value = $string_sum"