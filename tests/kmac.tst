*Testcase KMAC fc0
sysclear
archmode esame
r 1A0=00000001800000000000000000000200 # z/Arch restart PSW
r 1D0=0002000180000000000000000000DEAD # z/Arch pgm new PSW
r 200=41000000     # LA R0,0           R0->function code 0
r 204=4110f500      #  LA R1,PB          R1->parameter block address
r 208=41200000     # LA R2,FO          R2->first operand
r 20C=41400000     # LA R4,SO          R4->second operand
r 210=41500000     # LA R5,SOL         R5->second operand length
r 214=B91E0024     # KMAC R2,R4        Compute message authentication code
r 218=12ee077eB2B20300      #  LPSWE WAITPSW     Load enabled wait PSW
r 300=00020001800000000000000000000000 #  WAITPSW Enabled wait state PSW
*
r 500=000102030405060708090A0B0C0D0E0F # Parameter block
*
r 580=F0703838000000000000000000000000 # Expected result
*
runtest .1
*Compare
* Display parameter block
r 500.10
*Want  F0000000 00000000 00000000 00000000
* Expected result
*Done

*Testcase KMAC fcbad
sysclear
archmode esame
r 1A0=00000001800000000000000000000200 # z/Arch restart PSW
r 1D0=0002000180000000000000000000DEAD # z/Arch pgm new PSW
r 200=4100007f     # LA R0,63          R0->bad
r 204=4110f500      #  LA R1,PB          R1->parameter block address
r 208=4140f700      #  LA R4,SO          R4->second operand
r 20C=41500008     # LA R5,SOL         R5->second operand length
r 210=B91E0024     # KMAC R2,R4        Compute message authentication code
r 214=12ee077eB2B20300      #  LPSWE WAITPSW     Load enabled wait PSW
*Program 6
runtest .1
*Done

*Testcase KMAC fc1
sysclear
archmode esame
r 1A0=00000001800000000000000000000200 # z/Arch restart PSW
r 1D0=0002000180000000000000000000DEAD # z/Arch pgm new PSW
r 200=41000001     # LA R0,X'01'       R0->function code 1 encrypt
r 204=4110f500      #  LA R1,PB          R1->parameter block address
r 208=4140f700      #  LA R4,SO          R4->second operand
r 20C=41500008     # LA R5,SOL         R5->second operand length
r 210=B91E0024     # KMAC R2,R4        Compute message authentication code
r 214=12ee077eB2B20300      #  LPSWE WAITPSW     Load enabled wait PSW
r 300=00020001800000000000000000000000 #  WAITPSW Enabled wait state PSW
*
r 500=000102030405060708090A0B0C0D0E0F # Parameter block
*
r 580=D7423E1B84911C2E                 # Expected result
*
r 700=0001020304050607                 # Second operand
*
runtest .1
*Compare
* Display parameter blocks
r 500.8
*Want  D7423E1B 84911C2E
* Expected results
*Done

*Testcase KMAC fc2
sysclear
archmode esame
r 1A0=00000001800000000000000000000200 # z/Arch restart PSW
r 1D0=0002000180000000000000000000DEAD # z/Arch pgm new PSW
r 200=41000002     # LA R0,X'02'       R0->function code 2 encrypt
r 204=4110f500      #  LA R1,PB          R1->parameter block address
r 208=4140f700      #  LA R4,SO          R4->second operand
r 20C=41500008     # LA R5,SOL         R5->second operand length
r 210=B91E0024     # KMAC R2,R4        Compute message authentication code
r 214=12ee077eB2B20300      #  LPSWE WAITPSW     Load enabled wait PSW
r 300=00020001800000000000000000000000 #  WAITPSW Enabled wait state PSW
*
r 500=000102030405060708090A0B0C0D0E0F # Parameter block
r 510=1011121314151617                 # Parameter block
*
r 580=F4F9F93F1B40EDE7                 # Expected result
*
r 700=0001020304050607                 # Second operand
*
runtest .1
*Compare
* Display parameter blocks
r 500.8
*Want  F4F9F93F 1B40EDE7
* Expected results
*Done

*Testcase KMAC fc3
sysclear
archmode esame
r 1A0=00000001800000000000000000000200 # z/Arch restart PSW
r 1D0=0002000180000000000000000000DEAD # z/Arch pgm new PSW
r 200=41000003     # LA R0,X'03'       R0->function code 3 encrypt
r 204=4110f500      #  LA R1,PB          R1->parameter block address
r 208=4140f700      #  LA R4,SO          R4->second operand
r 20C=41500008     # LA R5,SOL         R5->second operand length
r 210=B91E0024     # KMAC R2,R4        Compute message authentication code
r 214=12ee077eB2B20300      #  LPSWE WAITPSW     Load enabled wait PSW
r 300=00020001800000000000000000000000 #  WAITPSW Enabled wait state PSW
*
r 500=000102030405060708090A0B0C0D0E0F # Parameter block
r 510=101112131415161718191A1B1C1D1E1F # Parameter block
*
r 580=5790A6D02A3BF337                 # Expected result
*
r 700=0001020304050607                 # Second operand
*
runtest .1
*Compare
* Display parameter blocks
r 500.8
*Want  5790A6D0 2A3BF337
*Done
