_main
                PUSH    {R4,R5,LR}
; �������� ����� ��� 20 ���������� ���� int + ��� ����� ����������
                SUB     SP, SP, #0x54   

; ������ ����

                MOVS    R0, #0          ; i
                MOV     R5, SP          ; ��������� �� ������ ������� �������

loc_1CE                                 
                LSLS    R1, R0, #1      ; R1=i<<1 (�� �� ��� � i*2)
                LSLS    R2, R0, #2      ; R2=i<<2 (�� �� ��� � i*4)
                ADDS    R0, R0, #1      ; i=i+1
                CMP     R0, #20         ; i<20?
                STR     R1, [R5,R2]     ; ��������� R1 � *(R5+R2) (�� �� ��� � R5+i*4) 
                BLT     loc_1CE         ; ��, i<20, ��������� ���� ����� �����

; ������ ����

                MOVS    R4, #0          ; i=0
loc_1DC                                 
                LSLS    R0, R4, #2      ; R0=i<<2 (�� �� ��� � i*4)
                LDR     R2, [R5,R0]     ; ��������� �� *(R5+R0) (�� �� ��� � R5+i*4)
                MOVS    R1, R4
                ADR     R0, aADD        ; "a[%d]=%d\n"
                BL      __2printf
                ADDS    R4, R4, #1      ; i=i+1
                CMP     R4, #20         ; i<20?
                BLT     loc_1DC         ; ��, i<20, ��������� ���� ����� �����
                MOVS    R0, #0          ; �������� ��� ��������
; ���������� ����� � �����, ���������� ��� 20-� ���������� ���� int � ��� ����� ����������
                ADD     SP, SP, #0x54
                POP     {R4,R5,PC}
