org 100h   ; Origin, starting address for our program

; Define data segment
start_time dw 0         ; Variable to store start time
stop_time  dw 0         ; Variable to store stop time
elapsed_time dw 0       ; Variable to store elapsed time
current_time dw 0       ; Mockup of the current time
carry_flag db 0         ; Mockup of the carry flag

start:
    ; Initialization
    mov ax, 0          ; Clear AX register
    mov [start_time], ax
    mov [stop_time], ax
    mov [elapsed_time], ax
    mov [carry_flag], 0 ; Initialize carry flag

main_loop:
    call UPDATE         ; Update elapsed time
    call DISPLAY        ; Display elapsed time
    jmp main_loop       ; Repeat

; Subroutine to start the stopwatch
start_stopwatch:
    ; Get current time and store as start time
    call GET_TIME
    mov [start_time], ax
    mov byte ptr [carry_flag], 1 ; Set carry flag to indicate stopwatch running
    ret

; Subroutine to stop the stopwatch
stop_stopwatch:
    ; Get current time and calculate elapsed time
    call GET_TIME
    mov [stop_time], ax
    sub ax, [start_time]
    mov [elapsed_time], ax
    mov byte ptr [carry_flag], 0 ; Clear carry flag to indicate stopwatch stopped
    ret

; Subroutine to reset the stopwatch
reset_stopwatch:
    ; Clear all times
    mov ax, 0
    mov [start_time], ax
    mov [stop_time], ax
    mov [elapsed_time], ax
    mov byte ptr [carry_flag], 0 ; Clear carry flag
    ret

; Subroutine to update the elapsed time
UPDATE:
    cmp byte ptr [carry_flag], 1 ; Check if stopwatch is running
    jne not_running
    call GET_TIME
    sub ax, [start_time]
    mov [elapsed_time], ax
not_running:
    ret

; Mockup subroutine to get current time (for demonstration purposes)
GET_TIME:
    ; This subroutine would be replaced with a real time-getting routine
    mov ax, [current_time]
    add ax, 1           ; Increment mock time
    mov [current_time], ax
    ret

; Subroutine to display the elapsed time (for demonstration purposes)
DISPLAY:
    ; In a real program, this would output the time to the screen
    nop                 ; No operation (placeholder)
    ret